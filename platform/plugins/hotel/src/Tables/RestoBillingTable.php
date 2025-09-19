<?php

namespace Botble\Hotel\Tables;

use Botble\Table\Abstracts\TableAbstract;
use Botble\Table\Columns\Column;
use Botble\Table\Columns\IdColumn;
use Botble\Table\Columns\CreatedAtColumn;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Collection;

/**
 * Table for Resto billings (collection from API)
 */
class RestoBillingTable extends TableAbstract
{
    protected Collection $restoUnpaid;

    public function setup(): void
    {
        // No model binding here, since we use a collection
    }

    public function setData($restoUnpaid): static
    {
        if (is_array($restoUnpaid)) {
            $this->restoUnpaid = collect($restoUnpaid);
        } elseif ($restoUnpaid instanceof Collection) {
            $this->restoUnpaid = $restoUnpaid;
        } else {
            $this->restoUnpaid = collect([]);
        }

        return $this;
    }

    public function ajax(): JsonResponse
    {
        // kalau kosong, return JSON valid agar tidak error
        if ($this->restoUnpaid->isEmpty()) {
            return $this->toJson($this->table->collection(collect([])));
        }

        $collection = $this->restoUnpaid->map(function ($b) {
            return (object) [
                'id'            => $b['id'] ?? null,
                'customer_name' => $b['customer_name'] ?? ($b['guest_name'] ?? '-'),
                'room_name'     => $b['room_name'] ?? $b['room_id'] ?? '-',
                'total'         => $b['total'] ?? ($b['amount'] ?? 0),
                'created_at'    => $b['created_at'] ?? now()->toDateTimeString(),
                'status'        => $b['status'] ?? 'unpaid',
            ];
        });

        $data = $this->table
            ->collection($collection)
            ->editColumn('total', fn ($item) => format_price($item->total))
            ->editColumn('status', fn ($item) =>
                '<span class="badge bg-warning text-white">' . ucfirst($item->status) . '</span>'
            );

        return $this->toJson($data);
    }

    public function hasActions(): bool
    {
        return false;
    }

    public function hasOperations(): bool
    {
        return false;
    }


    public function columns(): array
    {
        return [
            IdColumn::make(),
            Column::make('customer_name')->title('Customer')->alignLeft(),
            Column::make('room_name')->title('Room')->alignLeft(),
            Column::make('total')->title('Total')->alignLeft(),
            CreatedAtColumn::make(),
            Column::make('status')->title('Status')->alignLeft(),
        ];
    }
}
