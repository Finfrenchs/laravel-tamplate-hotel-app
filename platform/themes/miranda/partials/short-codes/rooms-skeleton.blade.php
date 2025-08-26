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

    .rooms-skeleton .skeleton-image {
        height: 100vh;
        min-height: 600px;
    }

    .rooms-skeleton .skeleton-content {
        height: 100vh;
        min-height: 600px;
        display: flex;
        align-items: center;
        justify-content: center;
        background: #f8f8f8;
    }

    .rooms-skeleton .skeleton-room-info {
        text-align: center;
        width: 100%;
        max-width: 500px;
    }

    .rooms-skeleton .skeleton-icon {
        width: 60px;
        height: 60px;
        border-radius: 50%;
        margin: 0 auto 30px;
    }

    .rooms-skeleton .skeleton-title {
        height: 36px;
        width: 250px;
        margin: 0 auto 20px;
        border-radius: 4px;
    }

    .rooms-skeleton .skeleton-desc {
        height: 14px;
        border-radius: 4px;
        margin: 0 auto 8px;
        max-width: 400px;
    }

    .rooms-skeleton .skeleton-desc.short {
        width: 70%;
    }

    .rooms-skeleton .skeleton-counter {
        position: absolute;
        right: 30px;
        bottom: 30px;
    }

    .rooms-skeleton .skeleton-count-small {
        height: 24px;
        width: 40px;
        border-radius: 4px;
        margin-bottom: 5px;
    }

    .rooms-skeleton .skeleton-count-big {
        height: 60px;
        width: 60px;
        border-radius: 4px;
    }
</style>

<section class="room-slider">
    <div class="container-fluid p-0 rooms-skeleton">
        <div class="row no-gutters">
            <div class="col-lg-6">
                <div class="skeleton-image skeleton-loading-bg"></div>
            </div>
            <div class="col-lg-6">
                <div class="skeleton-content">
                    <div class="skeleton-room-info">
                        <div class="skeleton-icon skeleton-loading-bg"></div>
                        <h2>
                            <div class="skeleton-title skeleton-loading-bg"></div>
                        </h2>
                        <p>
                        <div class="skeleton-desc skeleton-loading-bg"></div>
                        <div class="skeleton-desc skeleton-loading-bg"></div>
                        <div class="skeleton-desc skeleton-loading-bg short"></div>
                        </p>
                    </div>
                    <div class="skeleton-counter">
                        <div class="skeleton-count-small skeleton-loading-bg"></div>
                        <div class="skeleton-count-big skeleton-loading-bg"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
