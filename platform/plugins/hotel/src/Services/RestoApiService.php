<?php

namespace Botble\Hotel\Services;

use Illuminate\Support\Facades\Http;

class RestoApiService
{
    protected string $baseUrl;

    public function __construct()
    {
        $this->baseUrl = env('RESTO_API_URL') ?: config('services.resto_api.base_url', 'https://resto.kedasresort.com/api/v1/resto');
    }

    // 🔹 Ambil semua unpaid billing (lobby + hotel)
    public function getBillings(array $params = [])
    {
        return Http::get($this->baseUrl . '/unpaid-all', $params)->json();
    }

    // 🔹 Detail draft (lobby)
    public function getDraftDetail(int $id)
    {
        return Http::get($this->baseUrl . "/draft-orders/{$id}")->json();
    }

    // 🔹 Detail order (hotel/lobby)
    public function getOrderDetail(int $id)
    {
        return Http::get($this->baseUrl . "/orders/{$id}")->json();
    }

    // 🔹 Bayar lobby
    public function payLobby(int $id)
    {
        return Http::post($this->baseUrl . "/{$id}/pay-lobby")->json();
    }

    // 🔹 Bayar hotel
    public function payHotel(int $id)
    {
        return Http::post($this->baseUrl . "/{$id}/pay-hotel")->json();
    }

    // // 🔹 Ambil semua unpaid billing (lobby + hotel)
    // public function getBillings(array $params = [])
    // {
    //     return Http::get($this->baseUrl . '/unpaid-all', $params)->json();
    // }

    // // 🔹 Detail order (hotel/lobby)
    // public function getOrderDetail(int $id)
    // {
    //     return Http::get($this->baseUrl . "/orders/{$id}")->json();
    // }

    // // 🔹 Bayar lobby
    // public function payLobby(int $id)
    // {
    //     return Http::put($this->baseUrl . "/{$id}/pay-lobby")->json();
    // }

    // // 🔹 Bayar hotel
    // public function payHotel(int $id)
    // {
    //     return Http::put($this->baseUrl . "/{$id}/pay-hotel")->json();
    // }


    // public function __construct()
    // {
    //     // prioritas: env -> config('services') -> default
    //     $this->baseUrl = env('RESTO_API_URL') ?: config('services.resto_api.base_url', 'http://10.175.66.159:8001/api/v1');
    // }

    // public function getBillings(array $params = [])
    // {
    //     return Http::get($this->baseUrl . '/billings', $params)->json();
    // }

    // public function getBillingSummary(int $roomId)
    // {
    //     return Http::get($this->baseUrl . "/billings/summary", ['room_id' => $roomId])->json();
    // }

    // public function payBilling(int $billingId)
    // {
    //     return Http::put($this->baseUrl . "/billings/{$billingId}/pay")->json();
    // }
}
