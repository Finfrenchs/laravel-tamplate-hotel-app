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

    .contact-home-skeleton .skeleton-title {
        height: 16px;
        width: 120px;
        border-radius: 4px;
        margin-bottom: 20px;
    }

    .contact-home-skeleton .skeleton-heading {
        height: 48px;
        width: 100%;
        max-width: 400px;
        border-radius: 4px;
        margin-bottom: 40px;
    }

    .contact-home-skeleton .skeleton-field {
        height: 50px;
        width: 100%;
        border-radius: 4px;
        margin-bottom: 20px;
    }

    .contact-home-skeleton .skeleton-textarea {
        height: 120px;
        width: 100%;
        border-radius: 4px;
        margin-bottom: 20px;
    }

    .contact-home-skeleton .skeleton-button {
        height: 50px;
        width: 150px;
        border-radius: 25px;
    }

    .contact-home-skeleton .skeleton-map {
        height: 100%;
        min-height: 500px;
        border-radius: 4px;
    }
</style>

<section class="contact-part pt-115 pb-115">
    <div class="container contact-home-skeleton">
        <div class="row">
            <div class="col-lg-6">
                <div class="contact-form">
                    <div class="section-title">
                        <span class="title-tag">
                            <div class="skeleton-title skeleton-loading-bg"></div>
                        </span>
                        <h2>
                            <div class="skeleton-heading skeleton-loading-bg"></div>
                        </h2>
                    </div>
                    <form>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="skeleton-field skeleton-loading-bg"></div>
                            </div>
                            <div class="col-md-6">
                                <div class="skeleton-field skeleton-loading-bg"></div>
                            </div>
                            <div class="col-12">
                                <div class="skeleton-field skeleton-loading-bg"></div>
                            </div>
                            <div class="col-12">
                                <div class="skeleton-field skeleton-loading-bg"></div>
                            </div>
                            <div class="col-12">
                                <div class="skeleton-textarea skeleton-loading-bg"></div>
                            </div>
                            <div class="col-12">
                                <div class="skeleton-button skeleton-loading-bg"></div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="skeleton-map skeleton-loading-bg"></div>
            </div>
        </div>
    </div>
</section>
