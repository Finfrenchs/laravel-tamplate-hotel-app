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

    .testimonial-skeleton .skeleton-img {
        width: 115px;
        height: 115px;
        border-radius: 50%;
        margin: 0 auto 20px;
    }

    .testimonial-skeleton .skeleton-name {
        height: 24px;
        width: 150px;
        margin: 0 auto 10px;
        border-radius: 4px;
    }

    .testimonial-skeleton .skeleton-position {
        height: 16px;
        width: 100px;
        margin: 0 auto 20px;
        border-radius: 4px;
    }

    .testimonial-skeleton .skeleton-content {
        height: 14px;
        border-radius: 4px;
        margin-bottom: 8px;
    }

    .testimonial-skeleton .skeleton-content.short {
        width: 85%;
        margin: 0 auto;
    }
</style>

<section class="testimonial-section pb-115 pt-115">
    <div class="container">
        <div class="section-title text-center mb-80">
            <span class="title-tag">
                <div
                    class="skeleton-loading-bg"
                    style="height: 16px; width: 120px; margin: 0 auto; border-radius: 4px;"
                ></div>
            </span>
            <h2>
                <div
                    class="skeleton-loading-bg"
                    style="height: 32px; width: 300px; margin: 16px auto 0; border-radius: 4px;"
                ></div>
            </h2>
        </div>
        <div class="row">
            @for ($i = 0; $i < 3; $i++)
                <div class="col-lg-4">
                    <div class="testimonial-box testimonial-skeleton">
                        <div class="client-img">
                            <div class="skeleton-img skeleton-loading-bg"></div>
                        </div>
                        <h3>
                            <div class="skeleton-name skeleton-loading-bg"></div>
                        </h3>
                        <span class="clinet-post">
                            <div class="skeleton-position skeleton-loading-bg"></div>
                        </span>
                        <p>
                        <div class="skeleton-content skeleton-loading-bg"></div>
                        <div class="skeleton-content skeleton-loading-bg"></div>
                        <div class="skeleton-content skeleton-loading-bg short"></div>
                        </p>
                    </div>
                </div>
            @endfor
        </div>
    </div>
</section>
