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

    .foods-skeleton .skeleton-title {
        height: 16px;
        width: 120px;
        border-radius: 4px;
        margin: 0 auto 20px;
    }

    .foods-skeleton .skeleton-heading {
        height: 48px;
        width: 100%;
        max-width: 500px;
        border-radius: 4px;
        margin: 0 auto 60px;
    }

    .foods-skeleton .skeleton-food-item {
        display: flex;
        align-items: center;
        margin-bottom: 30px;
    }

    .foods-skeleton .skeleton-food-img {
        width: 100px;
        height: 100px;
        border-radius: 50%;
        margin-right: 30px;
        flex-shrink: 0;
    }

    .foods-skeleton .skeleton-food-content {
        flex: 1;
    }

    .foods-skeleton .skeleton-food-name {
        height: 24px;
        width: 200px;
        border-radius: 4px;
        margin-bottom: 10px;
    }

    .foods-skeleton .skeleton-food-desc {
        height: 14px;
        border-radius: 4px;
        margin-bottom: 6px;
    }

    .foods-skeleton .skeleton-food-desc.short {
        width: 80%;
    }
</style>

<section class="menu-area gradient-white pt-115 pb-115">
    <div class="container foods-skeleton">
        <div class="section-title text-center mb-50">
            <span class="title-tag">
                <div class="skeleton-title skeleton-loading-bg"></div>
            </span>
            <h2>
                <div class="skeleton-heading skeleton-loading-bg"></div>
            </h2>
        </div>
        <div class="menu-items">
            <div class="row">
                @for ($col = 0; $col < 2; $col++)
                    <div class="col-lg-6 col-md-6">
                        <div class="menu-item-wrapper">
                            @for ($i = 0; $i < 4; $i++)
                                <div class="single-menu-item skeleton-food-item">
                                    <div class="skeleton-food-img skeleton-loading-bg"></div>
                                    <div class="skeleton-food-content">
                                        <h4>
                                            <div class="skeleton-food-name skeleton-loading-bg"></div>
                                        </h4>
                                        <p>
                                        <div class="skeleton-food-desc skeleton-loading-bg"></div>
                                        <div class="skeleton-food-desc skeleton-loading-bg short"></div>
                                        </p>
                                    </div>
                                </div>
                            @endfor
                        </div>
                    </div>
                @endfor
            </div>
        </div>
    </div>
</section>
