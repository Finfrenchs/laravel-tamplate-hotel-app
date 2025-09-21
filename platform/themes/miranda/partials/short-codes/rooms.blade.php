<section class="room-slider pt-5 pb-5" style="background-color: #f9f9f9;">
    <div class="container">
        {{-- Title & Subtitle --}}
        <div class="section-header d-flex justify-content-between align-items-start mb-4">
            <div class="section-text">
                <p class="section-title">PILIHAN KAMAR TERBAIK</p>
                <h2 class="section-subtitle">Nikmati kenyamanan anda.</h2>
            </div>
            <div class="slider-arrows">
                <button class="prev-arrow"><i class="fal fa-angle-left"></i></button>
                <button class="next-arrow"><i class="fal fa-angle-right"></i></button>
            </div>
        </div>

        {{-- Slider --}}
        <div class="rooms-slider-horizontal">
            @foreach ($rooms as $room)
                <a href="{{ $room->url }}" class="single-rooms-box">
                    <div class="room-img" style="background-image: url({{ RvMedia::getImageUrl($room->image, '550x580', false, RvMedia::getDefaultImage()) }});"></div>
                    <div class="room-desc">
                        <h3>{{ $room->name }}</h3>
                        <p>{{ Str::limit($room->description, 100) }}</p>
                        <div class="price">RP{{ number_format($room->price,0,',','.') }}</div>
                    </div>
                </a>
            @endforeach
        </div>

        {{-- Arrows --}}
        {{-- <div class="slider-arrows">
            <button class="prev-arrow"><i class="fal fa-angle-left"></i></button>
            <button class="next-arrow"><i class="fal fa-angle-right"></i></button>
        </div> --}}
    </div>
</section>


{{-- <section class="room-slider pt-5 pb-5">
    <div class="container">
        <div class="rooms-slider-horizontal">
            @foreach ($rooms as $room)
                <a href="{{ $room->url }}" class="single-rooms-box"> --}}
                    {{-- Gambar Room --}}
                    {{-- <div class="room-img" style="background-image: url({{ RvMedia::getImageUrl($room->image, '550x580', false, RvMedia::getDefaultImage()) }});"></div> --}}

                    {{-- Konten Room --}}
                    {{-- <div class="room-desc">
                        <h3>{{ $room->name }}</h3>
                        <p>{{ Str::limit($room->description, 100) }}</p>
                        <div class="price">{{ $room->price }}</div>
                    </div>
                </a>
            @endforeach
        </div>
    </div>
</section> --}}

{{-- <section class="room-slider pt-5 pb-5">
    <div class="container">
        <div class="rooms-slider-slick">
            @foreach ($rooms as $room)
                <div class="single-rooms-box">
                    {{-- Gambar Room --}}
                    {{-- <a href="{{ $room->url }}">
                        <div class="room-img" style="background-image: url({{ RvMedia::getImageUrl($room->image, '550x580', false, RvMedia::getDefaultImage()) }});"></div> --}}

                        {{-- Konten Room --}}
                        {{-- <div class="room-desc">
                            <h3>{{ $room->name }}</h3>
                            <p>{{ Str::limit($room->description, 100) }}</p>
                            <div class="price">{{ $room->price }}</div>
                        </div>
                    </a>
                </div>
            @endforeach
        </div>
    </div>
</section> --}}



{{-- <section class="room-slider">
    <div class="container-fluid p-0">
        <div class="row rooms-slider-one">
            @foreach ($rooms as $room)
                <div class="col">
                    <div
                        class="slider-img"
                        style="background-image: url({{ RvMedia::getImageUrl($room->image, '550x580') }});"
                    ></div>
                </div>
            @endforeach
        </div>
    </div>
    <div class="rooms-content-wrap">
        <div class="container">
            <div class="row justify-content-center justify-content-md-start">
                <div class="col-xl-4 col-lg-5 col-sm-8">
                    <div class="room-content-box">
                        <div class="slider-count"></div>
                        <div class="slider-count-big"></div>
                        <div class="room-content-slider">
                            @foreach ($rooms as $room)
                                <div class="single-content">
                                    <div class="icon">
                                        {!! BaseHelper::renderIcon($shortcode->{'icon_room_' . $room->id} ?: 'flaticon-hotel') !!}
                                    </div>
                                    <h3><a href="{{ $room->url }}">{{ $room->name }}</a></h3>
                                    <p>{{ $room->description }}</p>
                                </div>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section> --}}
