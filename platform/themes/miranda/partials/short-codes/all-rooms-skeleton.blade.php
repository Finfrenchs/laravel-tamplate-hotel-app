<style>
    @keyframes skeleton-loading {
        0% {
            background-position: -200% 0;
        }

        100% {
            background-position: 200% 0;
        }
    }

    .skeleton-loading-bg {
        background: linear-gradient(90deg, #f0f0f0 25%, #e0e0e0 50%, #f0f0f0 75%);
        background-size: 200% 100%;
        animation: skeleton-loading 1.5s infinite;
    }

    .all-rooms-skeleton .skeleton-counter {
        height: 24px;
        width: 180px;
        border-radius: 4px;
        margin-bottom: 30px;
    }

    .all-rooms-skeleton .skeleton-room-img {
        height: 200px;
        border-radius: 4px 4px 0 0;
    }

    .all-rooms-skeleton .skeleton-room-name {
        height: 20px;
        width: 180px;
        border-radius: 4px;
        margin-bottom: 10px;
    }

    .all-rooms-skeleton .skeleton-amenity {
        height: 14px;
        width: 100px;
        border-radius: 4px;
        display: inline-block;
        margin-right: 10px;
        margin-bottom: 6px;
    }

    .all-rooms-skeleton .skeleton-price {
        height: 24px;
        width: 80px;
        border-radius: 4px;
        margin-bottom: 10px;
    }

    .all-rooms-skeleton .skeleton-button {
        height: 36px;
        width: 100px;
        border-radius: 4px;
    }

    .all-rooms-skeleton .skeleton-sidebar {
        height: 400px;
        border-radius: 4px;
    }
</style>

<section class="pt-60 pb-120">
    <div class="container all-rooms-skeleton">
        <div class="skeleton-counter skeleton-loading-bg"></div>
        <div class="row">
            <div class="col-lg-8">
                <div class="row">
                    @for ($i = 0; $i < 6; $i++)
                        <div class="col-md-6 mb-30">
                            <div class="room-box">
                                <div class="room-img-wrap">
                                    <div class="skeleton-room-img skeleton-loading-bg"></div>
                                </div>
                                <div class="room-desc">
                                    <h4>
                                        <div class="skeleton-room-name skeleton-loading-bg"></div>
                                    </h4>
                                    <ul class="room-info">
                                        <li>
                                            <div class="skeleton-amenity skeleton-loading-bg"></div>
                                        </li>
                                        <li>
                                            <div class="skeleton-amenity skeleton-loading-bg"></div>
                                        </li>
                                    </ul>
                                    <div class="room-price">
                                        <div class="skeleton-price skeleton-loading-bg"></div>
                                    </div>
                                    <div class="skeleton-button skeleton-loading-bg"></div>
                                </div>
                            </div>
                        </div>
                    @endfor
                </div>
            </div>
            <div class="col-lg-4">
                <div class="skeleton-sidebar skeleton-loading-bg"></div>
            </div>
        </div>
    </div>
</section>
