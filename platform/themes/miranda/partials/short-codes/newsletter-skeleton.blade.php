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

    .newsletter-skeleton .skeleton-logo {
        width: 200px;
        height: 60px;
        border-radius: 4px;
        margin: 0 auto 30px;
    }

    .newsletter-skeleton .skeleton-heading {
        height: 36px;
        width: 100%;
        max-width: 400px;
        border-radius: 4px;
        margin: 0 auto 20px;
    }

    .newsletter-skeleton .skeleton-desc {
        height: 14px;
        border-radius: 4px;
        margin: 0 auto 8px;
        max-width: 500px;
    }

    .newsletter-skeleton .skeleton-desc.short {
        width: 70%;
    }

    .newsletter-skeleton .skeleton-form {
        display: flex;
        justify-content: center;
        align-items: center;
        max-width: 500px;
        margin: 30px auto 0;
    }

    .newsletter-skeleton .skeleton-input {
        height: 50px;
        flex: 1;
        border-radius: 25px 0 0 25px;
    }

    .newsletter-skeleton .skeleton-submit {
        height: 50px;
        width: 120px;
        border-radius: 0 25px 25px 0;
    }
</style>

<section class="newsletter-section pt-115 pb-115">
    <div class="container newsletter-skeleton">
        <div class="newsletter-wrap">
            <div class="row align-items-center">
                <div class="col-lg-12">
                    <div class="newsletter-box text-center">
                        <div class="skeleton-logo skeleton-loading-bg"></div>
                        <h2>
                            <div class="skeleton-heading skeleton-loading-bg"></div>
                        </h2>
                        <p>
                        <div class="skeleton-desc skeleton-loading-bg"></div>
                        <div class="skeleton-desc skeleton-loading-bg short"></div>
                        </p>
                        <div class="skeleton-form">
                            <div class="skeleton-input skeleton-loading-bg"></div>
                            <div class="skeleton-submit skeleton-loading-bg"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
