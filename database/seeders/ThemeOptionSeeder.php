<?php

namespace Database\Seeders;

use Botble\Base\Supports\BaseSeeder;
use Botble\Setting\Facades\Setting;
use Botble\Theme\Facades\ThemeOption;
use Botble\Theme\Supports\ThemeSupport;

class ThemeOptionSeeder extends BaseSeeder
{
    public function run(): void
    {
        $this->uploadFiles('general');
        $this->uploadFiles('sliders');

        Setting::newQuery()->where('key', 'LIKE', ThemeOption::getOptionKey('%'))->delete();

        Setting::set(ThemeOption::prepareFromArray([
            'site_title' => 'Hotel Miranda',
            'seo_description' => 'Miranda - Laravel Hotel & Resort Multilingual Booking System',
            'copyright' => '©%Y Miranda. All right reserved.',
            'cookie_consent_message' => 'Your experience on this site will be improved by allowing cookies ',
            'cookie_consent_learn_more_url' => '/cookie-policy',
            'cookie_consent_learn_more_text' => 'Cookie Policy',
            'homepage_id' => '1',
            'blog_page_id' => '2',
            'logo' => 'general/logo.png',
            'logo_white' => 'general/logo-white.png',
            'favicon' => 'general/favicon.png',
            'email' => 'info@webmail.com',
            'address' => '14/A, Miranda City, NYC',
            'hotline' => '+908 987 877 09',
            'news_banner' => 'general/banner-news.jpg',
            'rooms_banner' => 'general/banner-news.jpg',
            'term_of_use_url' => '#',
            'privacy_policy_url' => '#',
            'preloader_enabled' => 'no',
            'about-us' => 'Lorem ipsum dolor sit amet, consect etur adipisicing elit, sed doing eius mod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitat ion ullamco laboris nisi.',
            'hotel_rules' => '<ul><li>No smoking, parties or events.</li><li>Check-in time from 2 PM, check-out by 10 AM.</li><li>Time to time car parking</li><li>Download Our minimal app</li><li>Browse regular our website</li></ul>',
            'cancellation' => '<p>Phasellus volutpat neque a tellus venenatis, a euismod augue facilisis. Fusce ut metus mattis, consequat metus nec, luctus lectus. Pellentesque orci quis hendrerit sed eu dolor. <strong>Cancel up</strong> to <strong>14 days</strong> to get a full refund.</p>',
            'slider-image-1' => 'sliders/04.jpg',
            'slider-title-1' => 'The ultimate luxury experience',
            'slider-description-1' => '<p>The Perfect<br>Base For You</p>',
            'slider-primary-button-text-1' => 'Take A tour',
            'slider-primary-button-url-1' => '/rooms',
            'slider-secondary-button-text-1' => 'About us',
            'slider-secondary-button-url-1' => '/about-us',
            'slider-image-2' => 'sliders/05.jpg',
            'slider-title-2' => 'The ultimate luxury experience',
            'slider-description-2' => '<p>The Perfect<br>Base For You</p>',
            'slider-primary-button-text-2' => 'Take A tour',
            'slider-primary-button-url-2' => '/rooms',
            'slider-secondary-button-text-2' => 'About us',
            'slider-secondary-button-url-2' => '/about-us',
            'primary_font' => 'Archivo',
            'secondary_font' => 'Old Standard TT',
            'tertiary_font' => 'Roboto',
            'social_links' => ThemeSupport::getDefaultSocialLinksData(),
        ]));

        Setting::save();
    }
}
