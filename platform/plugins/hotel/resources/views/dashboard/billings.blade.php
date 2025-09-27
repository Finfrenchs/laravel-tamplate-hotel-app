@extends(BaseHelper::getAdminMasterLayoutTemplate())

@section('breadcrumb')
    <li class="breadcrumb-item"><a href="{{ route('dashboard.index') }}">Dashboard</a></li>
    <li class="breadcrumb-item active">Billings</li>
@endsection

@section('content')
<div class="w-full">
    <div class="page-header">
        <h1 class="page-title">Dashboard Restaurant Billings</h1>
    </div>

    <form method="GET" action="{{ route('hotel-invoices.dashboard.billings') }}" class="mb-4">
        <input type="text" name="search" value="{{ $search ?? '' }}" placeholder="Cari nama tamu / customer..."
               class="form-control w-1/3 inline-block" />

        <button type="submit" class="btn btn-primary mt-3">Search</button>
    </form>

    {{-- Resto Unpaid Billings --}}
    <div class="panel w-full">
        <div class="panel-heading">
            <h3 class="panel-title">Resto Unpaid Billings</h3>
        </div>
        <div class="panel-body overflow-x-auto">
            <table class="table table-striped w-full">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Customer</th>
                        <th>Table/Room</th>
                        <th>Total</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                @forelse(($restoUnpaid ?? []) as $billing)
                    <tr>
                        <td>{{ $billing['id'] }}</td>
                        <td>{{ $billing['customer_name'] ?? $billing['draft_name'] ?? '-' }}</td>
                        <td>{{ $billing['table_name'] ?? $billing['room_name'] ?? '-' }}</td>
                        <td>{{ format_price($billing['total'] ?? 0) }}</td>
                        <td><span class="badge bg-warning text-white">Unpaid</span></td>
                        <td>
                            {{-- <a href="{{ route('hotel-invoices.show', $billing['id']) }}" class="btn btn-sm btn-primary">View</a> --}}
                            <a href="{{ route('hotel-invoices.show', ['id' => $billing['id'], 'type' => $billing['type']]) }}" class="btn btn-sm btn-primary">
                                Detail
                            </a>
                        </td>
                    </tr>
                @empty
                    <tr>
                        <td colspan="6" class="text-center">Tidak ada tagihan resto.</td>
                    </tr>
                @endforelse
                </tbody>
            </table>
        </div>
    </div>
</div>

@endsection


{{-- platform/plugins/hotel/resources/views/dashboard/billings.blade.php --}}
{{-- @extends(BaseHelper::getAdminMasterLayoutTemplate()) --}}

{{-- @section('breadcrumb')
    <li class="breadcrumb-item">
        <a href="{{ route('dashboard.index') }}">Dashboard</a>
    </li>
    <li class="breadcrumb-item active">Hotel & Resto Billings</li>
@endsection

@section('content')
    <div class="page-header">
        <div class="{{ AdminAppearance::getContainerWidth() }}">
            <div class="row g-2 align-items-center">
                <div class="col">
                    <h2 class="page-title">Hotel & Resto Billings</h2>
                </div>
                <div class="col-auto ms-auto d-print-none">
                    <div class="btn-list">
                        @stack('header-action')
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="{{ AdminAppearance::getContainerWidth() }}">
        <div class="row"> --}}
            {{-- Hotel invoices --}}
            {{-- <div class="col-md-6">
                <div class="card h-100">
                    <div class="card-header">
                        <h3 class="card-title">Hotel Unpaid Invoices</h3>
                    </div>
                    <div class="card-body table-responsive">
                        {!! $hotelTable->renderTable() !!}
                    </div>
                </div>
            </div> --}}

            {{-- Resto billings --}}
            {{-- <div class="col-md-6">
                <div class="card h-100">
                    <div class="card-header">
                        <h3 class="card-title">Resto Unpaid Billings</h3>
                    </div>
                    <div class="card-body table-responsive">
                        {!! $restoTable->renderTable() !!}
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection --}}


{{-- platform/plugins/hotel/resources/views/dashboard/billings.blade.php --}}

{{-- @extends(BaseHelper::getAdminMasterLayoutTemplate()) --}}

{{-- @section('breadcrumb')
@endsection --}}
{{-- @section('breadcrumb')
    <li class="breadcrumb-item"><a href="{{ route('dashboard.index') }}">Dashboard</a></li>
    <li class="breadcrumb-item active">Billings</li>
@endsection


@section('content')
    <div class="w-full">
        <div class="page-header">
            <h1 class="page-title">Dashboard Hotel & Resto Billings</h1>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 gap-6"> --}}
            {{-- Hotel Unpaid Invoices --}}
            {{-- <div class="panel w-full">
                <div class="panel-heading">
                    <h3 class="panel-title">Hotel Unpaid Invoices</h3>
                </div>
                <div class="panel-body overflow-x-auto">
                    <table class="table table-striped w-full">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Room</th>
                            <th>Guest</th>
                            <th>Total</th>
                            <th>Status</th>
                        </tr>
                        </thead>
                        <tbody>
                        @forelse($hotelUnpaid as $invoice)
                            @php
                                $booking = $invoice->reference;
                                $room = $booking?->room?->room?->name ?? '-';
                                $guest = $booking?->customer?->name ?? '-';
                            @endphp
                            <tr>
                                <td>{{ $invoice->id }}</td>
                                <td>{{ $room }}</td>
                                <td>{{ $guest }}</td>
                                <td>{{ format_price($invoice->amount) }}</td>
                                <td><span class="badge bg-warning text-white">Unpaid</span></td>
                            </tr>
                        @empty
                            <tr>
                                <td colspan="5" class="text-center">Tidak ada tagihan hotel yang belum dibayar.</td>
                            </tr>
                        @endforelse
                        </tbody>
                    </table>
                </div>
            </div> --}}

            {{-- Resto Unpaid Billings --}}
            {{-- <div class="panel w-full">
                <div class="panel-heading">
                    <h3 class="panel-title">Resto Unpaid Billings</h3>
                </div>
                <div class="panel-body overflow-x-auto">
                    <table class="table table-striped w-full">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Customer</th>
                            <th>Table</th>
                            <th>Total</th>
                            <th>Status</th>
                        </tr>
                        </thead>
                        <tbody>
                        @forelse(($restoUnpaid ?? []) as $billing)
                            <tr>
                                <td>{{ $billing['id'] }}</td>
                                <td>{{ $billing['draft_name'] ?? '-' }}</td>
                                <td>{{ $billing['table_name'] ?? '-' }}</td>
                                <td>{{ format_price($billing['total'] ?? 0) }}</td>
                                <td><span class="badge bg-warning text-white">Unpaid</span></td>
                            </tr>
                        @empty
                            <tr>
                                <td colspan="5" class="text-center">Tidak ada tagihan resto yang belum dibayar.</td>
                            </tr>
                        @endforelse
                        </tbody>
                    </table>
                </div>
            </div>

        </div>
    </div>
@endsection --}}


{{-- platform/plugins/hotel/resources/views/dashboard/billings.blade.php --}}

{{-- @extends(BaseHelper::getAdminMasterLayoutTemplate()) --}}

{{-- @section('content')
    <div class="max-w-screen-xl mx-auto">
        <div class="page-header">
            <h1 class="page-title">Dashboard Hotel & Resto Billings</h1>
        </div>

        <div class="grid grid-cols-2 gap-6"> --}}
            {{-- Hotel Unpaid Invoices --}}
            {{-- <div class="panel">
                <div class="panel-heading">
                    <h3 class="panel-title">Hotel Unpaid Invoices</h3>
                </div>
                <div class="panel-body">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Room</th>
                            <th>Guest</th>
                            <th>Total</th>
                            <th>Status</th>
                        </tr>
                        </thead>
                        <tbody>
                        @forelse($hotelUnpaid as $invoice)
                            <tr>
                                <td>{{ $invoice->id }}</td>
                                <td>{{ $invoice->room_id }}</td>
                                <td>{{ $invoice->booking->first_name ?? '' }} {{ $invoice->booking->last_name ?? '' }}</td>
                                <td>{{ format_price($invoice->amount) }}</td>
                                <td><span class="badge bg-warning">Unpaid</span></td>
                            </tr>
                        @empty
                            <tr>
                                <td colspan="5" class="text-center">Tidak ada tagihan hotel yang belum dibayar.</td>
                            </tr>
                        @endforelse
                        </tbody>
                    </table>
                </div>
            </div> --}}

            {{-- Resto Unpaid Billings --}}
            {{-- <div class="panel">
                <div class="panel-heading">
                    <h3 class="panel-title">Resto Unpaid Billings</h3>
                </div>
                <div class="panel-body">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Customer</th>
                            <th>Room</th>
                            <th>Total</th>
                            <th>Status</th>
                        </tr>
                        </thead>
                        <tbody>
                        @forelse(($restoUnpaid ?? []) as $billing)
                            <tr>
                                <td>{{ $billing['id'] }}</td>
                                <td>{{ $billing['customer_name'] ?? '-' }}</td>
                                <td>{{ $billing['room_id'] ?? '-' }}</td>
                                <td>{{ format_price($billing['total'] ?? 0) }}</td>
                                <td><span class="badge bg-warning">Unpaid</span></td>
                            </tr>
                        @empty
                            <tr>
                                <td colspan="5" class="text-center">Tidak ada tagihan resto yang belum dibayar.</td>
                            </tr>
                        @endforelse

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
@endsection --}}
