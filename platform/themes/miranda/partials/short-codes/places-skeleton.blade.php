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

    .places-skeleton .skeleton-place {
        position: relative;
        overflow: hidden;
        border-radius: 4px;
        margin-bottom: 30px;
    }

    .places-skeleton .skeleton-place-img {
        height: 280px;
    }

    .places-skeleton .skeleton-place-info {
        position: absolute;
        bottom: 0;
        left: 0;
        right: 0;
        padding: 30px;
        background: rgba(0, 0, 0, 0.1);
    }

    .places-skeleton .skeleton-place-name {
        height: 24px;
        width: 180px;
        background: rgba(255, 255, 255, 0.3);
        border-radius: 4px;
        margin-bottom: 10px;
    }

    .places-skeleton .skeleton-place-distance {
        height: 16px;
        width: 120px;
        background: rgba(255, 255, 255, 0.2);
        border-radius: 4px;
    }
</style>

<section class="places-wrapper pt-120 pb-90">
    <div class="container places-skeleton">
        <div class="row">
            @for ($i = 0; $i < 6; $i++)
                <div class="col-lg-4 col-md-6 col-sm-12">
                    <div class="place-item skeleton-place">
                        <div class="skeleton-place-img skeleton-loading-bg">
                            <div class="skeleton-place-info">
                                <h3>
                                    <div class="skeleton-place-name"></div>
                                </h3>
                                <span>
                                    <div class="skeleton-place-distance"></div>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            @endfor
        </div>
    </div>
</section>
