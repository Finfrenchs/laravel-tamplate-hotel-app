<?php

namespace Botble\Hotel\Http\Controllers;

use Botble\Base\Http\Controllers\BaseController;
use Botble\Hotel\Models\Booking;
use Botble\Hotel\Models\Invoice;
use Botble\Hotel\Services\RestoApiService;
use Illuminate\Http\Request;
// use Botble\Hotel\Tables\HotelInvoiceTable; // NEW
// use Botble\Hotel\Tables\RestoBillingTable; // NEW
use Botble\Base\Facades\Assets;


class HotelInvoiceController extends BaseController
{
    protected RestoApiService $restoApi;

    public function __construct(RestoApiService $restoApi)
    {
        $this->restoApi = $restoApi;
    }

    // 🔹 Dashboard Billings (RESTO SAJA)
    public function dashboardBillings(Request $request)
    {
        $search = $request->query('search');

        // Ambil resto unpaid (dari API)
        $restoResponse = $this->restoApi->getBillings(['search' => $search]);
        $restoUnpaid = $restoResponse['data'] ?? [];

        return view('plugins/hotel::dashboard.billings', compact('restoUnpaid', 'search'));
    }

    // 🔹 Show detail invoice resto
    // di controller
    public function showInvoiceWithResto($id, Request $request)
    {
        $type = $request->query('type'); // lobby / hotel

        if ($type === 'lobby') {
            $response = $this->restoApi->getDraftDetail($id);
        } else {
            $response = $this->restoApi->getOrderDetail($id);
        }

        if (!isset($response['data'])) {
            abort(404, 'Invoice not found');
        }

        $data = $response['data'];

        // 🔹 Normalisasi agar field sama untuk draft dan order
        // $invoice = [
        //     'id'             => $data['id'] ?? null,
        //     'customer_name'  => $data['customer_name']
        //                         ?? $data['draft_name']
        //                         ?? '-',
        //     'table_name'     => $data['table_name'] ?? null,
        //     'room_id'        => !empty($data['room_id']) && $data['room_id'] != 0
        //                         ? $data['room_id']
        //                         : null,
        //     'total'          => $data['total'] ?? 0,
        //     'status'         => $data['status']
        //                         ?? ($type === 'lobby' ? 'unpaid' : 'pending'),
        //     'payment_method' => $data['payment_method']
        //                         ?? ($type === 'lobby' ? 'Bill Lobby' : 'Bill Hotel'),
        //     'created_at'     => $data['created_at']
        //                         ?? $data['transaction_time']
        //                         ?? null,
        //     'items'          => collect($data['items'] ?? $data['order_items'] ?? [])->map(function ($item) {
        //         return [
        //             'id'       => $item['id'] ?? null,
        //             'name'     => $item['product']['name'] ?? '-',
        //             'qty'      => $item['quantity'] ?? 0,
        //             'price'    => $item['price'] ?? 0,
        //             'subtotal' => ($item['quantity'] ?? 0) * ($item['price'] ?? 0),
        //         ];
        //     })->toArray(),
        // ];

        $invoice = (object) [
            'id'             => $data['id'] ?? null,
            'customer_name'  => $data['customer_name'] ?? $data['draft_name'] ?? '-',
            'table_name'     => $data['table_name'] ?? null,
            'room_id'        => !empty($data['room_id']) && $data['room_id'] != 0 ? $data['room_id'] : null,
            'total'          => $data['total'] ?? 0,
            'status'         => $data['status'] ?? ($type === 'lobby' ? 'unpaid' : 'pending'),
            'payment_method' => $data['payment_method'] ?? ($type === 'lobby' ? 'Bill Lobby' : 'Bill Hotel'),
            'created_at'     => $data['created_at'] ?? $data['transaction_time'] ?? null,
            'items'          => collect($data['items'] ?? $data['order_items'] ?? [])->map(function ($item) {
                return (object) [
                    'id'       => $item['id'] ?? null,
                    'name'     => $item['product']['name'] ?? '-',
                    'qty'      => $item['quantity'] ?? 0,
                    'price'    => $item['price'] ?? 0,
                    'subtotal' => ($item['quantity'] ?? 0) * ($item['price'] ?? 0),
                ];
            }),
        ];

        return view('plugins/hotel::dashboard.show', compact('invoice'));
    }




    // 🔹 Bayar invoice resto
    public function payInvoiceWithResto(Request $request, $id)
    {
        $type = $request->input('type', 'lobby');

        try {
            if ($type === 'lobby') {
                $response = $this->restoApi->payLobby($id);
            } elseif ($type === 'hotel') {
                $response = $this->restoApi->payHotel($id);
            }

            if (!isset($response['status']) || $response['status'] !== 'success') {
                return redirect()->back()->with('error', 'API gagal: ' . ($response['message'] ?? 'Unknown error'));
            }

            return redirect()
                ->route('hotel-invoices.dashboard.billings')
                ->with('success', 'Invoice berhasil dibayar.');
        } catch (\Exception $e) {
            return redirect()
                ->back()
                ->with('error', 'Gagal membayar invoice: ' . $e->getMessage());
        }
    }



    // public function showInvoiceWithResto($id, Request $request)
    // {
    //     $type = $request->query('type'); // lobby/hotel

    //     if ($type === 'lobby') {
    //         $response = $this->restoApi->getDraftDetail($id);
    //     } else {
    //         $response = $this->restoApi->getOrderDetail($id);
    //     }

    //     if (!isset($response['data'])) {
    //         abort(404, 'Invoice not found');
    //     }

    //     $invoice = $response['data'];

    //     return view('plugins/hotel::invoices.show', compact('invoice'));
    // }


    // // 🔹 Dashboard Billings
    // public function dashboardBillings(Request $request)
    // {
    //     $search = $request->query('search');

    //     // Hotel unpaid invoices
    //     $hotelUnpaid = Invoice::with('booking.customer', 'booking.room.room')
    //         ->where('status', 'pending')
    //         ->when($search, function ($q) use ($search) {
    //             $q->whereHas('booking.customer', function ($q2) use ($search) {
    //                 $q2->where('name', 'like', "%$search%");
    //             });
    //         })
    //         ->get();

    //     // Resto unpaid
    //     $restoResponse = $this->restoApi->getBillings(['search' => $search]);
    //     $restoUnpaid = $restoResponse['data'] ?? [];

    //     return view('plugins/hotel::dashboard.billings', compact('hotelUnpaid', 'restoUnpaid', 'search'));
    // }

    // // 🔹 Show detail invoice hotel + resto
    // public function showInvoiceWithResto($id)
    // {
    //     $invoice = Invoice::with('booking.customer', 'booking.room.room')->findOrFail($id);

    //     // Ambil data resto unpaid berdasarkan room_id
    //     $restoResponse = $this->restoApi->getBillings(['search' => $invoice->room_id]);
    //     $restoBillings = $restoResponse['data'] ?? [];

    //     return view('plugins/hotel::dashboard.show', compact('invoice', 'restoBillings'));
    // }

    // // 🔹 Update invoice + resto orders
    // public function updateInvoiceWithResto(Request $request, $id)
    // {
    //     $invoice = Invoice::findOrFail($id);

    //     // Update hotel invoice status
    //     $invoice->status = $request->input('status', 'paid');
    //     $invoice->save();

    //     // Update resto orders
    //     if ($request->has('resto_ids')) {
    //         foreach ($request->resto_ids as $resto) {
    //             if ($resto['type'] === 'lobby') {
    //                 $this->restoApi->payLobby($resto['id']);
    //             } elseif ($resto['type'] === 'hotel') {
    //                 $this->restoApi->payHotel($resto['id']);
    //             }
    //         }
    //     }

    //     return redirect()->route('hotel-invoices.dashboard.billings')
    //         ->with('success', 'Invoice hotel & billing resto berhasil diperbarui.');
    // }

    // // 🔹 GET /admin/hotel/invoices/{room_id}
    // public function showInvoiceWithResto($roomId)
    // {
    //     $invoice = Invoice::where('room_id', $roomId)->with('booking')->firstOrFail();
    //     $restoSummary = $this->restoApi->getBillingSummary($roomId);

    //     return view('plugins/hotel::invoices.show', [
    //         'invoice' => $invoice,
    //         'restoSummary' => $restoSummary,
    //     ]);
    // }

    // // 🔹 POST /admin/hotel/invoices/{room_id}/pay
    // public function payInvoiceWithResto(Request $request, $roomId)
    // {
    //     $invoice = Invoice::where('room_id', $roomId)->firstOrFail();

    //     // proses pembayaran hotel → update status invoice
    //     $invoice->status = 'paid';
    //     $invoice->save();

    //     // sync ke resto
    //     if ($request->has('billing_ids')) {
    //         foreach ($request->billing_ids as $billingId) {
    //             $this->restoApi->payBilling($billingId);
    //         }
    //     }

    //     return redirect()->back()->with('success', 'Invoice dan billing resto berhasil dibayar.');
    // }

    // 🔹 GET /admin/hotel/dashboard/billings
    // CHANGE: dashboardBillings -> use TableAbstracts
    // public function dashboardBillings(HotelInvoiceTable $hotelTable)
    // {
    //     // ambil dari resto
    //     $restoUnpaid = $this->restoApi->getBillings(['status' => 'unpaid']);

    //     if (! is_array($restoUnpaid)) {
    //         $restoUnpaid = [];
    //     }

    //     // Provide assets like other index pages
    //     Assets::addScripts(['bootstrap-editable'])->addStyles(['bootstrap-editable']);

    //     // create resto table instance with data
    //     // $restoTable = new RestoBillingTable($restoUnpaid);
    //     $restoTable = app(RestoBillingTable::class)->setData($restoUnpaid);

    //     $this->pageTitle('Hotel & Resto Billings');

    //     // render combined view — pass table objects (we'll call renderTable() in blade)
    //    return view('plugins/hotel::dashboard.billings', [
    //         'hotelTable' => $hotelTable,
    //         'restoTable' => $restoTable,
    //     ]);

    // }

    // public function dashboardBillings()
    // {
    //     $hotelUnpaid = Invoice::where('status', 'pending')->with('booking')->get();

    //     $response = $this->restoApi->getBillings();
    //     // $response = $this->restoApi->getBillings(['status' => 'unpaid']);

    //     // Ambil data saja
    //     $restoUnpaid = $response['data'] ?? [];

    //     return view('plugins/hotel::dashboard.billings', [
    //         'hotelUnpaid' => $hotelUnpaid,
    //         'restoUnpaid' => $restoUnpaid,
    //     ]);
    // }


    // public function dashboardBillings()
    // {
    //     $hotelUnpaid = Invoice::where('status', 'unpaid')->with('booking')->get();
    //     $restoUnpaid = $this->restoApi->getBillings(['status' => 'unpaid']);

    //     return view('plugins/hotel::dashboard.billings', [
    //         'hotelUnpaid' => $hotelUnpaid,
    //         'restoUnpaid' => $restoUnpaid,
    //     ]);
    // }
}
