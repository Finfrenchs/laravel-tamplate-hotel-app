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

    .video-intro-skeleton .skeleton-title {
        height: 16px;
        width: 120px;
        border-radius: 4px;
        margin-bottom: 20px;
    }

    .video-intro-skeleton .skeleton-heading {
        height: 48px;
        width: 100%;
        max-width: 480px;
        border-radius: 4px;
        margin-bottom: 25px;
    }

    .video-intro-skeleton .skeleton-content {
        height: 14px;
        border-radius: 4px;
        margin-bottom: 8px;
    }

    .video-intro-skeleton .skeleton-content.short {
        width: 85%;
    }

    .video-intro-skeleton .skeleton-button {
        height: 50px;
        width: 160px;
        border-radius: 25px;
        margin-top: 25px;
    }

    .video-intro-skeleton .skeleton-video {
        height: 580px;
        border-radius: 4px;
        position: relative;
    }

    .video-intro-skeleton .skeleton-play {
        width: 80px;
        height: 80px;
        border-radius: 50%;
        background: rgba(255, 255, 255, 0.3);
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
    }
</style>

<section class="text-block with-bg pt-115 pb-115">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-6 video-intro-skeleton">
                <div class="block-text">
                    <div class="section-title mb-40">
                        <span class="title-tag">
                            <div class="skeleton-title skeleton-loading-bg"></div>
                        </span>
                        <h2>
                            <div class="skeleton-heading skeleton-loading-bg"></div>
                        </h2>
                    </div>
                    <p>
                    <div class="skeleton-content skeleton-loading-bg"></div>
                    <div class="skeleton-content skeleton-loading-bg"></div>
                    <div class="skeleton-content skeleton-loading-bg"></div>
                    <div class="skeleton-content skeleton-loading-bg short"></div>
                    </p>
                    <div class="skeleton-button skeleton-loading-bg"></div>
                </div>
            </div>
            <div class="col-lg-6 video-intro-skeleton">
                <div class="video-wrap video-wrap-two video-about text-center">
                    <div class="skeleton-video skeleton-loading-bg">
                        <div class="skeleton-play"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
