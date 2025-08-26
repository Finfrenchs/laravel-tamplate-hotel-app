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

    .offers-skeleton .skeleton-room-img {
        height: 270px;
        border-radius: 4px 4px 0 0;
    }

    .offers-skeleton .skeleton-room-name {
        height: 24px;
        width: 200px;
        border-radius: 4px;
        margin-bottom: 15px;
    }

    .offers-skeleton .skeleton-amenity {
        height: 16px;
        width: 120px;
        border-radius: 4px;
        display: inline-block;
        margin-right: 15px;
        margin-bottom: 8px;
    }

    .offers-skeleton .skeleton-price {
        height: 32px;
        width: 100px;
        border-radius: 4px;
        margin-bottom: 15px;
    }

    .offers-skeleton .skeleton-button {
        height: 40px;
        width: 120px;
        border-radius: 4px;
    }
</style>

<section class="room-section room-grid-style pt-80 pb-80">
    <div class="container offers-skeleton">
        <div class="row">
            @for ($i = 0; $i < 4; $i++)
                <div class="col-lg-3 col-md-6">
                    <div class="room-box mb-30">
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
</section>
