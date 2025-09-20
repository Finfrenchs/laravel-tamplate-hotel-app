<div class="container">
    <div style="margin: 40px 0;">
        <h4 style="color: #f00; margin-bottom: 15px;">You need to setup your homepage first!</h4>

        <p><strong>1. Go to Admin -> Plugins then activate all plugins.</strong></p>
        <p><strong>2. Go to Admin -> Pages and create a page:</strong></p>

        <div style="margin: 20px 0;">
            <div>- Content:</div>
            <div style="border: 1px solid rgba(0,0,0,.1); padding: 10px; margin-top: 10px;direction: ltr;">
                <div>[home-banner][/home-banner]</div>
                <div>[check-availability-form][/check-availability-form]</div>
                <div>[video-introduction title="Take a tour" subtitle="Discover Our Underground." content="Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat." background_image="general/video-background-02.jpg" video_image="general/video-banner-01.jpg" video_url="https://www.youtube.com/watch?v=EEJFMdfraVY" button_text="Book Now" button_url="/rooms"][/video-introduction]</div>
                {{-- <div>[hotel-about title="since 1994" subtitle="Situated In Prime Position At The Foot Of The Slopes Of Courchevel Moriond." block_icon_1="flaticon-coffee" block_text_1="Breakfast" block_link_1="#" block_icon_2="flaticon-air-freight" block_text_2="Airport Pickup" block_link_2="#" block_icon_3="flaticon-marker" block_text_3="City Guide" block_link_3="#" block_icon_4="flaticon-barbecue" block_text_4="BBQ Party" block_link_4="#" block_icon_5="flaticon-hotel" block_text_5="Luxury Room" block_link_5="#"][/hotel-about]</div> --}}
                {!! do_shortcode('[hotel-about
                    title="Keunggulan Hotel Kami"
                    subtitle="Mengapa Memilih Kami?"
                    block_icon_1="flaticon-beach" block_text_1="Dekat dengan Pantai" block_link_1="Nikmati suasana liburan terbaik hanya dengan berjalan kaki menuju pantai. Pemandangan laut yang indah dan udara segar siap menyambut Anda setiap hari."
                    block_icon_2="flaticon-ship" block_text_2="Akses Mudah ke Pelabuhan Kapal Feri" block_link_2="Lokasi strategis dekat dengan pelabuhan kapal feri, memudahkan tamu yang ingin bepergian antar pulau atau sekadar menikmati perjalanan laut."
                    block_icon_3="flaticon-map" block_text_3="Berlokasi di Area Wisata Populer" block_link_3="Hotel kami berada di kawasan wisata, dikelilingi oleh destinasi menarik, kuliner khas, dan pusat hiburan yang siap melengkapi pengalaman liburan Anda."
                    block_icon_4="flaticon-briefcase" block_text_4="Pilihan Tepat untuk Liburan & Bisnis" block_link_4="Kombinasi lokasi strategis, fasilitas nyaman, dan suasana yang mendukung membuat hotel ini ideal untuk wisatawan maupun perjalanan bisnis."
                ]') !!}
                <div>[rooms][/rooms]</div>
                <div>[featured-news title="Blog" subtitle="News Feeds"][/featured-news]</div>
                {{-- <div>[room-categories title="Room Type" subtitle="Inspired Loading" background_image="general/bg.jpg"][/room-categories]</div> --}}
                {{-- <div>[hotel-featured-features title="The Thin Escape" subtitle="Miranda has everything for your trip & every single things." button_text="Take a tour" button_url="/rooms"][/hotel-featured-features]</div> --}}
                {{-- <div>[testimonial title="testimonials" subtitle="Client Feedback"][/testimonial]</div> --}}
                {{-- <div>[rooms-introduction title="Our rooms" subtitle="Each of our nine lovely double guest rooms feature a private bath, wi-fi, cable television and include full breakfast." background_image="general/bg.jpg" first_image="general/01.jpg" second_image="general/02.jpg" third_image="general/03.jpg" button_text="Take a tour" button_url="/rooms"][/rooms-introduction]</div> --}}
            </div>
            <br>
            <div>- Template: <strong>Homepage</strong>.</div>
        </div>

        <p><strong>3. Then go to Admin -> Appearance -> Theme options -> Page to set your homepage.</strong></p>
    </div>
</div>
