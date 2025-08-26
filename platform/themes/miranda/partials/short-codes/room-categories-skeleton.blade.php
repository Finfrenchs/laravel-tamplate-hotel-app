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

    .room-categories-skeleton .skeleton-title {
        height: 16px;
        width: 120px;
        border-radius: 4px;
        margin: 0 auto 20px;
    }

    .room-categories-skeleton .skeleton-heading {
        height: 48px;
        width: 100%;
        max-width: 600px;
        border-radius: 4px;
        margin: 0 auto 40px;
    }

    .room-categories-skeleton .skeleton-tab {
        height: 40px;
        width: 120px;
        border-radius: 20px;
        display: inline-block;
        margin: 0 10px;
    }

    .room-categories-skeleton .skeleton-room {
        position: relative;
        overflow: hidden;
        border-radius: 4px;
    }

    .room-categories-skeleton .skeleton-room-lg {
        height: 575px;
    }

    .room-categories-skeleton .skeleton-room-md {
        height: 280px;
    }

    .room-categories-skeleton .skeleton-room-info {
        position: absolute;
        bottom: 0;
        left: 0;
        right: 0;
        padding: 30px;
        background: rgba(0, 0, 0, 0.1);
    }

    .room-categories-skeleton .skeleton-room-name {
        height: 24px;
        width: 200px;
        background: rgba(255, 255, 255, 0.3);
        border-radius: 4px;
        margin-bottom: 10px;
    }

    .room-categories-skeleton .skeleton-room-count {
        height: 16px;
        width: 100px;
        background: rgba(255, 255, 255, 0.2);
        border-radius: 4px;
    }
</style>

<section class="room-type-section pt-115 pb-115">
    <div class="container room-categories-skeleton">
        <div class="section-title text-center mb-50">
            <span class="title-tag">
                <div class="skeleton-title skeleton-loading-bg"></div>
            </span>
            <h2>
                <div class="skeleton-heading skeleton-loading-bg"></div>
            </h2>
        </div>
        <ul class="nav nav-pills room-type-nav justify-content-center mb-60">
            @for ($i = 0; $i < 3; $i++)
                <li class="nav-item">
                    <div class="skeleton-tab skeleton-loading-bg"></div>
                </li>
            @endfor
        </ul>
        <div class="tab-content">
            <div class="tab-pane fade show active">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="skeleton-room skeleton-room-lg skeleton-loading-bg mb-30">
                            <div class="skeleton-room-info">
                                <h3>
                                    <div class="skeleton-room-name"></div>
                                </h3>
                                <div class="skeleton-room-count"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="skeleton-room skeleton-room-md skeleton-loading-bg mb-30">
                            <div class="skeleton-room-info">
                                <h3>
                                    <div class="skeleton-room-name"></div>
                                </h3>
                                <div class="skeleton-room-count"></div>
                            </div>
                        </div>
                        <div class="skeleton-room skeleton-room-md skeleton-loading-bg">
                            <div class="skeleton-room-info">
                                <h3>
                                    <div class="skeleton-room-name"></div>
                                </h3>
                                <div class="skeleton-room-count"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
