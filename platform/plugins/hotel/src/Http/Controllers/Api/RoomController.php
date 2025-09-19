<?php

namespace Botble\Hotel\Http\Controllers\Api;

use Botble\Hotel\Models\Room;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Carbon\Carbon;
use RvMedia;
use Botble\Base\Facades\BaseHelper;


class RoomController extends Controller
{
    /**
     * Get available rooms list
     */
    public function index()
    {
        $rooms = Room::query()
            ->with(['category', 'amenities', 'activeBookingRooms'])
            ->get()
            ->filter(fn($room) => $room->isCurrentlyAvailable())
            ->map(function ($room) {
                return [
                    'id'        => $room->id,
                    'name'      => $room->name,
                    'category'  => $room->category?->name,
                    // 'price'     => format_price($room->price),
                    'price' => (int) $room->price,
                    'images'    => collect($room->images)
                                    ->map(fn($img) => RvMedia::getImageUrl($img, 'medium'))
                                    ->toArray(),
                    'amenities' => $room->amenities->pluck('name')->toArray(),
                    'video_url' => $room->video_url,
                ];
            })
            ->values();

        return response()->json([
            'success' => true,
            'data'    => $rooms,
        ]);
    }

    /**
     * Get room by ID
     */
    public function show($id)
    {
        $room = Room::with(['category', 'amenities'])->findOrFail($id);

        return response()->json([
            'success' => true,
            'data' => [
                'id'          => $room->id,
                'name'        => $room->name,
                'category'    => $room->category?->name,
                // 'price'       => format_price($room->total_price),
                'price'       => (int) $room->price,
                'description' => BaseHelper::clean($room->description),
                'images'      => collect($room->images)->map(fn($img) => RvMedia::getImageUrl($img))->toArray(),
                'amenities'   => $room->amenities->pluck('name')->toArray(),
                'video_url'   => $room->video_url,
                'content'     => BaseHelper::clean($room->content),
            ]
        ]);
    }

}
