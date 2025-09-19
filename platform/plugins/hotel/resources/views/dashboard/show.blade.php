{{-- platform/plugins/hotel/resources/views/invoices/show.blade.php --}}
@extends(BaseHelper::getAdminMasterLayoutTemplate())

@push('header-action')
    <x-core::button
        tag="a"
        {{-- :href="route('hotel-invoices.print', ['id' => $invoice->id, 'type' => request('type')])" --}}
        target="_blank"
        icon="ti ti-printer">
        {{-- {{ trans('plugins/hotel::invoice.print') }} --}}
    </x-core::button>

    <x-core::button
        tag="a"
        {{-- :href="route('hotel-invoices.download', ['id' => $invoice->id, 'type' => request('type')])" --}}
        target="_blank"
        icon="ti ti-download">
        {{-- {{ trans('plugins/hotel::invoice.download') }} --}}
    </x-core::button>
@endpush

@section('content')
    <x-core::card size="lg">
        <x-core::card.body>
            <div class="row">
                <div class="col-6 offset-6 text-end">
                    <p class="h3">{{ trans('plugins/hotel::invoice.heading') }}</p>
                    <p class="mb-1"><strong>Customer:</strong> {{ $invoice->customer_name }}</p>

                    @if(!empty($invoice->table_name))
                        <p class="mb-1"><strong>Table:</strong> {{ $invoice->table_name }}</p>
                    @endif

                    @if(!empty($invoice->room_id))
                        <p class="mb-1"><strong>Room:</strong> {{ $invoice->room_id }}</p>
                    @endif
                </div>
            </div>

            <div class="my-5">
                <div class="row">
                    <div class="col-lg-3"><strong>Code:</strong> #INV-{{ $invoice->id }}</div>
                    <div class="col-lg-3"><strong>Status:</strong> {{ ucfirst($invoice->status ?? 'pending') }}</div>
                    <div class="col-lg-3">
                        <strong>Purchase at:</strong>
                        {{ !empty($invoice->created_at)
                            ? \Carbon\Carbon::parse($invoice->created_at)->format('j F, Y H:i')
                            : '-' }}
                    </div>
                    <div class="col-lg-3"><strong>Payment method:</strong> {{ $invoice->payment_method ?? '-' }}</div>
                </div>
            </div>

            {{-- Items --}}
            <x-core::table class="table-transparent">
                <x-core::table.header>
                    <x-core::table.header.cell>#</x-core::table.header.cell>
                    <x-core::table.header.cell>Menu</x-core::table.header.cell>
                    <x-core::table.header.cell>Qty</x-core::table.header.cell>
                    <x-core::table.header.cell class="text-center">Subtotal</x-core::table.header.cell>
                </x-core::table.header>
                <x-core::table.body>
                    @forelse($invoice->items as $item)
                        <x-core::table.body.row>
                            <td>{{ $item->id ?? '-' }}</td>
                            <td>{{ $item->name ?? '-' }}</td>
                            <td>{{ $item->qty ?? 0 }}</td>
                            <td class="text-center"><strong>{{ format_price($item->subtotal ?? 0) }}</strong></td>
                        </x-core::table.body.row>
                    @empty
                        <tr>
                            <td colspan="4" class="text-center">Tidak ada item</td>
                        </tr>
                    @endforelse
                </x-core::table.body>
            </x-core::table>

            <div class="mt-4 text-end">
                {{-- Tombol bayar --}}
                @if(($invoice->status ?? '') !== 'paid')
                    <form method="POST" action="{{ route('hotel-invoices.pay', ['id' => $invoice->id, 'type' => request('type')]) }}">
                        @csrf
                        @method('PUT')
                        <select name="status" class="form-control d-inline-block w-auto">
                            <option value="pending" {{ ($invoice->status ?? '') === 'pending' ? 'selected' : '' }}>Pending</option>
                            <option value="paid" {{ ($invoice->status ?? '') === 'paid' ? 'selected' : '' }}>Paid</option>
                        </select>
                        <button type="submit" class="btn btn-success">Save</button>
                    </form>
                @else
                    <span class="badge bg-success">Already Paid</span>
                @endif
            </div>
        </x-core::card.body>
    </x-core::card>
@endsection



{{-- @extends(BaseHelper::getAdminMasterLayoutTemplate())

@push('header-action')
    <x-core::button tag="a" :href="route('hotel-invoices.print', $invoice['id'])" target="_blank" icon="ti ti-printer">
        Print
    </x-core::button>
    <x-core::button tag="a" :href="route('hotel-invoices.download', $invoice['id'])" target="_blank" icon="ti ti-download">
        Download
    </x-core::button>
@endpush

@section('content')
    <x-core::card size="lg">
        <x-core::card.body>
            <div class="row">
                <div class="col-6 offset-6 text-end">
                    <p class="h3">Invoice</p>
                    <p class="mb-1">{{ $invoice['customer_name'] ?? '-' }}</p>
                    <p class="mb-1">{{ $invoice['customer_email'] ?? '-' }}</p>
                    <p class="mb-1">{{ $invoice['customer_phone'] ?? '-' }}</p>
                </div>
            </div>

            <div class="my-5">
                <div class="row">
                    <div class="col-lg-3"><strong>Code:</strong> #INV-{{ $invoice['id'] }}</div>
                    <div class="col-lg-3"><strong>Status:</strong> {{ ucfirst($invoice['status'] ?? 'pending') }}</div>
                    <div class="col-lg-3"><strong>Purchase at:</strong> {{ \Carbon\Carbon::parse($invoice['created_at'])->format('j F, Y') }}</div>
                    <div class="col-lg-3"><strong>Payment method:</strong> {{ $invoice['payment_method'] ?? '-' }}</div>
                </div>
            </div> --}}

            {{-- Items --}}
            {{-- <x-core::table class="table-transparent">
                <x-core::table.header>
                    <x-core::table.header.cell>#</x-core::table.header.cell>
                    <x-core::table.header.cell>Menu</x-core::table.header.cell>
                    <x-core::table.header.cell>Qty</x-core::table.header.cell>
                    <x-core::table.header.cell class="text-center">Subtotal</x-core::table.header.cell>
                </x-core::table.header>
                <x-core::table.body>
                    @forelse($invoice['items'] ?? [] as $item)
                        <x-core::table.body.row>
                            <td>{{ $item['id'] }}</td>
                            <td>{{ $item['name'] }}</td>
                            <td>{{ $item['qty'] }}</td>
                            <td class="text-center"><strong>{{ format_price($item['subtotal'] ?? 0) }}</strong></td>
                        </x-core::table.body.row>
                    @empty
                        <tr><td colspan="4" class="text-center">Tidak ada item</td></tr>
                    @endforelse
                </x-core::table.body>
            </x-core::table>

            <div class="mt-4 text-end">
                <form method="POST" action="{{ route('hotel-invoices.pay', $invoice['id']) }}">
                    @csrf
                    @method('PUT')
                    <select name="status" class="form-control d-inline-block w-auto">
                        <option value="pending" {{ ($invoice['status'] ?? '') === 'pending' ? 'selected' : '' }}>Pending</option>
                        <option value="paid" {{ ($invoice['status'] ?? '') === 'paid' ? 'selected' : '' }}>Paid</option>
                    </select>
                    <button type="submit" class="btn btn-success">Save</button>
                </form>
            </div>
        </x-core::card.body>
    </x-core::card>
@endsection --}}
