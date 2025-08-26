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

    .hotel-about-skeleton .skeleton-title {
        height: 16px;
        width: 120px;
        border-radius: 4px;
        margin: 0 auto;
    }

    .hotel-about-skeleton .skeleton-heading {
        height: 32px;
        width: 100%;
        max-width: 400px;
        border-radius: 4px;
        margin: 16px auto 0;
    }

    .hotel-about-skeleton .skeleton-feature {
        height: 100px;
        background: #f5f5f5;
        border-radius: 8px;
        padding: 30px;
        display: flex;
        align-items: center;
        justify-content: center;
        margin-bottom: 20px;
    }

    .hotel-about-skeleton .skeleton-icon {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        margin-right: 15px;
    }

    .hotel-about-skeleton .skeleton-text {
        height: 20px;
        width: 120px;
        border-radius: 4px;
    }
</style>

<section class="about-section pt-115 pb-115">
    <div class="container">
        <div
            class="down-arrow-wrap text-center"
            id="about-section"
        >
            <a
                class="down-arrow"
                href="#about-section"
                title="scroll"
            ><i class="fal fa-arrow-down"></i></a>
        </div>
        <div class="section-title about-title text-center mb-20 hotel-about-skeleton">
            <span class="title-tag">
                <div class="skeleton-title skeleton-loading-bg"></div>
            </span>
            <h2>
                <div class="skeleton-heading skeleton-loading-bg"></div>
            </h2>
        </div>
        <ul class="about-features masonry-layout hotel-about-skeleton">
            @for ($i = 1; $i <= 5; $i++)
                <li>
                    <div class="skeleton-feature">
                        <div class="skeleton-icon skeleton-loading-bg"></div>
                        <div class="skeleton-text skeleton-loading-bg"></div>
                    </div>
                </li>
            @endfor
        </ul>
    </div>
</section>
