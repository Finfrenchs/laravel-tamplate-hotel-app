<?php

namespace Botble\Hotel\Tables;

use Botble\Hotel\Models\Invoice;
use Botble\Table\Abstracts\TableAbstract;
use Botble\Table\Columns\Column;
use Botble\Table\Columns\IdColumn;
use Botble\Table\Columns\CreatedAtColumn;
use Botble\Table\Columns\StatusColumn;
use Botble\Table\Actions\EditAction;
use Botble\Table\Actions\DeleteAction;
use Botble\Table\BulkActions\DeleteBulkAction;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Relations\Relation;
use Illuminate\Database\Query\Builder as QueryBuilder;
use Illuminate\Http\JsonResponse;

class HotelInvoiceTable extends TableAbstract
{
    public function setup(): void
    {
        $this->model(Invoice::class);

        $this->addActions([
            EditAction::make()->route('invoices.show')->permission('invoices.edit'),
            DeleteAction::make()->route('invoices.destroy')->permission('invoices.destroy'),
        ]);
    }

    public function ajax(): JsonResponse
    {
        $data = $this->table
            ->eloquent($this->query())
            ->editColumn('amount', function (Invoice $item) {
                return format_price($item->amount);
            })
            ->editColumn('customer_name', function (Invoice $item) {
                if (! $item->customer_id || ! $item->customer) {
                    return $item->customer_name;
                }

                return $item->customer->name;
            });

        return $this->toJson($data);
    }

    public function query(): Relation|Builder|QueryBuilder
    {
        $query = $this->getModel()
            ->query()
            ->select([
                'id',
                'customer_id',
                'customer_name',
                'code',
                'amount',
                'created_at',
                'status',
                'reference_type',
                'reference_id',
            ])
            ->where('status', 'pending') // hanya unpaid
            ->with('customer');

        return $this->applyScopes($query);
    }

    public function columns(): array
    {
        return [
            IdColumn::make(),
            Column::make('customer_name')->title('Customer')->alignLeft(),
            Column::make('reference_id')->title('Booking/Room')->alignLeft(),
            Column::make('amount')->title('Total')->alignLeft(),
            CreatedAtColumn::make(),
            StatusColumn::make(),
        ];
    }

    public function bulkActions(): array
    {
        return [
            DeleteBulkAction::make()->permission('invoices.destroy'),
        ];
    }
}
