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

    .galleries-skeleton .skeleton-title {
        height: 16px;
        width: 120px;
        border-radius: 4px;
        margin: 0 auto 20px;
    }

    .galleries-skeleton .skeleton-heading {
        height: 48px;
        width: 100%;
        max-width: 500px;
        border-radius: 4px;
        margin: 0 auto 60px;
    }

    .galleries-skeleton .skeleton-gallery {
        position: relative;
        overflow: hidden;
        border-radius: 4px;
        margin-bottom: 30px;
    }

    .galleries-skeleton .skeleton-gallery-img {
        height: 280px;
    }

    .galleries-skeleton .skeleton-gallery-info {
        position: absolute;
        bottom: 0;
        left: 0;
        right: 0;
        padding: 30px;
        background: rgba(0, 0, 0, 0.1);
    }

    .galleries-skeleton .skeleton-gallery-name {
        height: 24px;
        width: 200px;
        background: rgba(255, 255, 255, 0.3);
        border-radius: 4px;
        margin-bottom: 10px;
    }

    .galleries-skeleton .skeleton-gallery-date {
        height: 16px;
        width: 120px;
        background: rgba(255, 255, 255, 0.2);
        border-radius: 4px;
    }
</style>

<section class="places-wrapper pt-90 pb-100">
    <div class="container galleries-skeleton">
        <div class="section-title text-center mb-50">
            <span class="title-tag">
                <div class="skeleton-title skeleton-loading-bg"></div>
            </span>
            <h2>
                <div class="skeleton-heading skeleton-loading-bg"></div>
            </h2>
        </div>
        <div class="row">
            @for ($i = 0; $i < 6; $i++)
                <div class="col-lg-4 col-md-6 col-sm-12">
                    <div class="place-item skeleton-gallery">
                        <div class="skeleton-gallery-img skeleton-loading-bg">
                            <div class="skeleton-gallery-info">
                                <h3>
                                    <div class="skeleton-gallery-name"></div>
                                </h3>
                                <span>
                                    <div class="skeleton-gallery-date"></div>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            @endfor
        </div>
    </div>
</section>
