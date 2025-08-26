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

    .features-skeleton .skeleton-heading {
        height: 48px;
        width: 100%;
        max-width: 400px;
        border-radius: 4px;
        margin-bottom: 25px;
    }

    .features-skeleton .skeleton-desc {
        height: 14px;
        border-radius: 4px;
        margin-bottom: 8px;
    }

    .features-skeleton .skeleton-desc.short {
        width: 85%;
    }

    .features-skeleton .skeleton-button {
        height: 50px;
        width: 180px;
        border-radius: 25px;
        margin-top: 30px;
    }

    .features-skeleton .skeleton-feature-item {
        display: flex;
        align-items: center;
        margin-bottom: 30px;
    }

    .features-skeleton .skeleton-number {
        width: 50px;
        height: 50px;
        border-radius: 50%;
        margin-right: 20px;
    }

    .features-skeleton .skeleton-feature-content {
        flex: 1;
    }

    .features-skeleton .skeleton-feature-title {
        height: 20px;
        width: 180px;
        border-radius: 4px;
        margin-bottom: 10px;
    }

    .features-skeleton .skeleton-feature-desc {
        height: 14px;
        border-radius: 4px;
    }

    .features-skeleton .skeleton-feature-desc.short {
        width: 80%;
    }
</style>

<section class="cta-section style-two pt-115 pb-115">
    <div class="container">
        <div class="cta-inner features-skeleton">
            <div class="row">
                <div class="col-xl-6 col-lg-8">
                    <div class="cta-text">
                        <div class="section-title mb-40">
                            <h2>
                                <div class="skeleton-heading skeleton-loading-bg"></div>
                            </h2>
                        </div>
                        <p>
                        <div class="skeleton-desc skeleton-loading-bg"></div>
                        <div class="skeleton-desc skeleton-loading-bg"></div>
                        <div class="skeleton-desc skeleton-loading-bg short"></div>
                        </p>
                        <div class="skeleton-button skeleton-loading-bg"></div>
                    </div>
                </div>
                <div class="col-xl-6 col-lg-4">
                    <div class="cta-features">
                        @for ($i = 1; $i <= 3; $i++)
                            <div class="single-feature skeleton-feature-item">
                                <div class="skeleton-number skeleton-loading-bg"></div>
                                <div class="skeleton-feature-content">
                                    <h4>
                                        <div class="skeleton-feature-title skeleton-loading-bg"></div>
                                    </h4>
                                    <p>
                                    <div class="skeleton-feature-desc skeleton-loading-bg"></div>
                                    <div class="skeleton-feature-desc skeleton-loading-bg short"></div>
                                    </p>
                                </div>
                            </div>
                        @endfor
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
