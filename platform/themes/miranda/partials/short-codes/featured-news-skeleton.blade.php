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

    .news-skeleton .skeleton-img {
        height: 280px;
        border-radius: 4px;
    }

    .news-skeleton .skeleton-meta {
        height: 14px;
        width: 120px;
        border-radius: 4px;
        display: inline-block;
        margin-right: 15px;
    }

    .news-skeleton .skeleton-title {
        height: 24px;
        width: 90%;
        border-radius: 4px;
        margin: 20px 0 15px;
    }

    .news-skeleton .skeleton-desc {
        height: 14px;
        border-radius: 4px;
        margin-bottom: 8px;
    }

    .news-skeleton .skeleton-desc.short {
        width: 80%;
    }
</style>

<section class="latest-news pt-115 pb-115">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-6 col-md-8 col-sm-7">
                <div class="section-title">
                    <span class="title-tag">
                        <div
                            class="skeleton-loading-bg"
                            style="height: 16px; width: 100px; border-radius: 4px;"
                        ></div>
                    </span>
                    <h2>
                        <div
                            class="skeleton-loading-bg"
                            style="height: 32px; width: 280px; margin-top: 16px; border-radius: 4px;"
                        ></div>
                    </h2>
                </div>
            </div>
            <div class="col-lg-6 col-md-4 col-sm-5 d-none d-sm-block">
                <div class="latest-post-arrow arrow-style text-right">
                </div>
            </div>
        </div>
        <div class="row mt-80">
            @for ($i = 0; $i < 3; $i++)
                <div class="col-lg-4">
                    <div class="latest-post-box news-skeleton">
                        <div class="post-img skeleton-img skeleton-loading-bg"></div>
                        <div class="post-desc">
                            <ul class="post-meta">
                                <li>
                                    <div class="skeleton-meta skeleton-loading-bg"></div>
                                </li>
                                <li>
                                    <div class="skeleton-meta skeleton-loading-bg"></div>
                                </li>
                            </ul>
                            <h3>
                                <div class="skeleton-title skeleton-loading-bg"></div>
                            </h3>
                            <p>
                            <div class="skeleton-desc skeleton-loading-bg"></div>
                            <div class="skeleton-desc skeleton-loading-bg"></div>
                            <div class="skeleton-desc skeleton-loading-bg short"></div>
                            </p>
                        </div>
                    </div>
                </div>
            @endfor
        </div>
    </div>
</section>
