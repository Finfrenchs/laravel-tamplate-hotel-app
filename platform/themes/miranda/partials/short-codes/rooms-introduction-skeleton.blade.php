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

    .rooms-intro-skeleton .skeleton-title {
        height: 16px;
        width: 120px;
        border-radius: 4px;
        margin: 0 auto 20px;
    }

    .rooms-intro-skeleton .skeleton-heading {
        height: 48px;
        width: 100%;
        max-width: 600px;
        border-radius: 4px;
        margin: 0 auto 30px;
    }

    .rooms-intro-skeleton .skeleton-button {
        height: 50px;
        width: 180px;
        border-radius: 25px;
        margin: 0 auto;
    }

    .rooms-intro-skeleton .skeleton-image {
        width: 160px;
        height: 160px;
        border-radius: 50%;
        position: absolute;
    }

    .rooms-intro-skeleton .skeleton-image-1 {
        top: 50px;
        left: 50px;
    }

    .rooms-intro-skeleton .skeleton-image-2 {
        top: 100px;
        right: 50px;
    }

    .rooms-intro-skeleton .skeleton-image-3 {
        bottom: 50px;
        left: 50%;
        transform: translateX(-50%);
    }
</style>

<section class="cta-section pt-115 pb-160">
    <div class="container">
        <div class="cta-inner rooms-intro-skeleton">
            <div class="row justify-content-center">
                <div class="col-lg-10 col-md-10">
                    <div class="cta-text">
                        <div class="section-title white-style text-center mb-20">
                            <span class="title-tag">
                                <div class="skeleton-title skeleton-loading-bg"></div>
                            </span>
                            <h2>
                                <div class="skeleton-heading skeleton-loading-bg"></div>
                            </h2>
                        </div>
                        <div class="skeleton-button skeleton-loading-bg"></div>
                    </div>
                </div>
            </div>
            <div class="skeleton-image skeleton-image-1 skeleton-loading-bg"></div>
            <div class="skeleton-image skeleton-image-2 skeleton-loading-bg"></div>
            <div class="skeleton-image skeleton-image-3 skeleton-loading-bg"></div>
        </div>
    </div>
</section>
