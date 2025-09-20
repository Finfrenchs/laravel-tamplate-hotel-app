{{-- Dynamic Hotel About Section --}}
<section class="about-section pt-115 pb-115">
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
    <div class="container">
        <div class="section-title about-title text-center mb-50">
            <span class="title-tag">{{ $title ?? 'Keunggulan Hotel Kami' }}</span>
            <h2>{{ $subtitle ?? 'Mengapa Memilih Kami?' }}</h2>
        </div>

        <div class="row">
            @if(!empty($tabs))
                @foreach($tabs as $item)
                    <div class="col-md-6 col-lg-4 mb-4">
                        <div class="feature-box text-center p-4 h-100">
                            <div class="feature-icon mb-3">
                                @if(!empty($item['icon_image']))
                                    <img src="{{ RvMedia::getImageUrl($item['icon_image']) }}" alt="icon">
                                @else
                                    {!! BaseHelper::renderIcon($item['icon'] ?? 'fas fa-star') !!}
                                @endif
                            </div>
                            <h5 class="mb-2">{{ $item['title'] ?? 'Judul Keunggulan' }}</h5>
                            <p>{{ $item['subtitle'] ?? 'Deskripsi singkat mengenai keunggulan hotel.' }}</p>
                        </div>
                    </div>
                @endforeach
            @endif
        </div>
    </div>
</section>


{{-- static Hotel About Section --}}
{{-- Static Hotel About Section --}}
{{-- <section class="about-section pt-115 pb-115">
    <div class="container">
        <div class="section-title about-title text-center mb-50">
            <span class="title-tag">Keunggulan Hotel Kami</span>
            <h2>Mengapa Memilih Kami?</h2>
        </div>

        <div class="row">
            <div class="col-md-6 col-lg-4 mb-4">
                <div class="feature-box text-center p-4 shadow-sm h-100">
                    <div class="feature-icon mb-3">
                        <i class="fas fa-umbrella-beach fa-3x text-primary"></i>
                    </div>
                    <h5 class="mb-2">Dekat dengan Pantai</h5>
                    <p>Nikmati suasana liburan terbaik hanya dengan berjalan kaki menuju pantai. Pemandangan laut yang indah siap menyambut Anda.</p>
                </div>
            </div>

            <div class="col-md-6 col-lg-4 mb-4">
                <div class="feature-box text-center p-4 shadow-sm h-100">
                    <div class="feature-icon mb-3">
                        <i class="fas fa-ship fa-3x text-primary"></i>
                    </div>
                    <h5 class="mb-2">Akses Mudah ke Pelabuhan Kapal Feri</h5>
                    <p>Lokasi strategis dekat pelabuhan kapal feri, memudahkan tamu untuk bepergian antar pulau.</p>
                </div>
            </div>

            <div class="col-md-6 col-lg-4 mb-4">
                <div class="feature-box text-center p-4 shadow-sm h-100">
                    <div class="feature-icon mb-3">
                        <i class="fas fa-map-marked-alt fa-3x text-primary"></i>
                    </div>
                    <h5 class="mb-2">Berlokasi di Area Wisata Populer</h5>
                    <p>Dikelilingi destinasi menarik, kuliner khas, dan pusat hiburan yang melengkapi liburan Anda.</p>
                </div>
            </div>

            <div class="col-md-6 col-lg-4 mb-4">
                <div class="feature-box text-center p-4 shadow-sm h-100">
                    <div class="feature-icon mb-3">
                        <i class="fas fa-briefcase fa-3x text-primary"></i>
                    </div>
                    <h5 class="mb-2">Pilihan Tepat untuk Liburan & Bisnis</h5>
                    <p>Kombinasi lokasi strategis, fasilitas nyaman, dan suasana mendukung untuk wisatawan maupun perjalanan bisnis.</p>
                </div>
            </div>
        </div>
    </div>
</section> --}}


{{-- original template --}}
{{-- <section class="about-section pt-115 pb-115">
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
        <div class="section-title about-title text-center mb-20">
            <span class="title-tag">{!! BaseHelper::clean($title) !!}</span>
            <h2>{!! BaseHelper::clean($description ?: $subtitle) !!}</h2>
        </div>
        <ul class="about-features masonry-layout">
            @for ($i = 1; $i <= 5; $i++)
                <li
                    class="wow fadeInUp"
                    data-wow-delay="{{ 0.1 + $i * 0.2 }}s"
                >
                    <a href="{{ ${'block_link_' . $i} }}">
                        {!! BaseHelper::renderIcon(${'block_icon_' . $i}) !!}
                        <span class="title">{{ ${'block_text_' . $i} }}</span>
                    </a>
                </li>
            @endfor
        </ul>
    </div>
</section> --}}
