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

    .core-features-skeleton .skeleton-title {
        height: 16px;
        width: 120px;
        border-radius: 4px;
        margin: 0 auto 20px;
    }

    .core-features-skeleton .skeleton-heading {
        height: 48px;
        width: 100%;
        max-width: 600px;
        border-radius: 4px;
        margin: 0 auto 60px;
    }

    .core-features-skeleton .skeleton-feature-box {
        text-align: center;
        margin-bottom: 30px;
    }

    .core-features-skeleton .skeleton-number {
        width: 60px;
        height: 60px;
        border-radius: 50%;
        margin: 0 auto 20px;
    }

    .core-features-skeleton .skeleton-icon {
        width: 50px;
        height: 50px;
        border-radius: 50%;
        margin: 0 auto 20px;
    }

    .core-features-skeleton .skeleton-feature-name {
        height: 24px;
        width: 180px;
        border-radius: 4px;
        margin: 0 auto 15px;
    }

    .core-features-skeleton .skeleton-feature-desc {
        height: 14px;
        border-radius: 4px;
        margin: 0 auto 6px;
        max-width: 280px;
    }

    .core-features-skeleton .skeleton-feature-desc.short {
        width: 70%;
    }
</style>

<section class="core-feature-section bg-black pt-115 pb-115">
    <div class="container core-features-skeleton">
        <div class="section-title white-style text-center mb-60">
            <span class="title-tag">
                <div class="skeleton-title skeleton-loading-bg"></div>
            </span>
            <h2>
                <div class="skeleton-heading skeleton-loading-bg"></div>
            </h2>
        </div>
        <div class="row">
            @for ($i = 0; $i < 6; $i++)
                <div class="col-lg-4 col-md-6">
                    <div class="feature-box skeleton-feature-box">
                        <div class="feature-counter">
                            <div class="skeleton-number skeleton-loading-bg"></div>
                        </div>
                        <div class="feature-icon">
                            <div class="skeleton-icon skeleton-loading-bg"></div>
                        </div>
                        <h3>
                            <div class="skeleton-feature-name skeleton-loading-bg"></div>
                        </h3>
                        <p>
                        <div class="skeleton-feature-desc skeleton-loading-bg"></div>
                        <div class="skeleton-feature-desc skeleton-loading-bg"></div>
                        <div class="skeleton-feature-desc skeleton-loading-bg short"></div>
                        </p>
                    </div>
                </div>
            @endfor
        </div>
    </div>
</section>
