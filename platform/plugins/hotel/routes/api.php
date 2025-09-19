<?php

use Illuminate\Support\Facades\Route;
use Botble\Hotel\Http\Controllers\Api\RoomController;

Route::group(['prefix' => 'api/v1', 'as' => 'api.'], function () {
    Route::get('rooms', [RoomController::class, 'index']);     // list available rooms
    Route::get('rooms/{id}', [RoomController::class, 'show']); // detail room by id
});
