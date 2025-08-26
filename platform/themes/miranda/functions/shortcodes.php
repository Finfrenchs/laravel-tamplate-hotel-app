<?php

use Botble\Base\Forms\FieldOptions\MediaImageFieldOption;
use Botble\Base\Forms\FieldOptions\SelectFieldOption;
use Botble\Base\Forms\FieldOptions\TextareaFieldOption;
use Botble\Base\Forms\FieldOptions\TextFieldOption;
use Botble\Base\Forms\Fields\CoreIconField;
use Botble\Base\Forms\Fields\MediaImageField;
use Botble\Base\Forms\Fields\SelectField;
use Botble\Base\Forms\Fields\TextareaField;
use Botble\Base\Forms\Fields\TextField;
use Botble\Gallery\Models\Gallery;
use Botble\Hotel\DataTransferObjects\RoomSearchParams;
use Botble\Hotel\Models\Feature;
use Botble\Hotel\Models\Food;
use Botble\Hotel\Models\FoodType;
use Botble\Hotel\Models\Place;
use Botble\Hotel\Models\Room;
use Botble\Hotel\Models\RoomCategory;
use Botble\Hotel\Services\GetRoomService;
use Botble\Shortcode\Compilers\Shortcode;
use Botble\Shortcode\Forms\FieldOptions\ShortcodeTabsFieldOption;
use Botble\Shortcode\Forms\Fields\ShortcodeTabsField;
use Botble\Shortcode\Forms\ShortcodeForm;
use Botble\Testimonial\Models\Testimonial;
use Botble\Theme\Facades\Theme;
use Botble\Theme\Supports\ThemeSupport;
use Botble\Theme\Supports\Youtube;
use Carbon\Carbon;

app()->booted(function (): void {
    ThemeSupport::registerGoogleMapsShortcode();
    ThemeSupport::registerYoutubeShortcode();

    add_shortcode('youtube-video', __('Youtube video'), __('Add youtube video'), function (Shortcode $shortcode) {
        Theme::asset()->usePath()->add('magnific-popup-css', 'css/magnific-popup.css');
        Theme::asset()->container('footer')->usePath()->add('jquery.magnific-popup', 'js/jquery.magnific-popup.min.js');

        return Theme::partial('short-codes.video', [
            'url' => Youtube::getYoutubeWatchURL($shortcode->url),
            'background_image' => $shortcode->background_image,
        ]);
    });

    if (is_plugin_active('testimonial')) {
        add_shortcode('testimonial', __('Testimonial'), __('Testimonial'), function (Shortcode $shortcode) {
            $testimonials = Testimonial::query()
                ->wherePublished()
                ->get();

            return Theme::partial('short-codes.testimonial', [
                'title' => $shortcode->title,
                'description' => $shortcode->description,
                'subtitle' => $shortcode->subtitle,
                'testimonials' => $testimonials,
            ]);
        });

        shortcode()->setAdminConfig('testimonial', function (array $attributes) {
            return ShortcodeForm::createFromArray($attributes)
                ->withLazyLoading()
                ->add(
                    'title',
                    TextField::class,
                    TextFieldOption::make()
                        ->label(__('Title'))
                        ->placeholder(__('Title'))
                )
                ->add(
                    'subtitle',
                    TextareaField::class,
                    TextareaFieldOption::make()
                        ->label(__('Subtitle'))
                        ->placeholder(__('Subtitle'))
                        ->rows(3)
                );
        });

        shortcode()->registerLoadingState('testimonial', Theme::getThemeNamespace('partials.short-codes.testimonial-skeleton'));
    }

    if (is_plugin_active('blog')) {
        add_shortcode('featured-news', __('Featured News'), __('Featured News'), function (Shortcode $shortcode) {
            $posts = get_featured_posts(6, ['author']);

            return Theme::partial('short-codes.featured-news', [
                'title' => $shortcode->title,
                'subtitle' => $shortcode->subtitle,
                'description' => $shortcode->description,
                'posts' => $posts,
            ]);
        });

        shortcode()->setAdminConfig('featured-news', function (array $attributes) {
            return ShortcodeForm::createFromArray($attributes)
                ->withLazyLoading()
                ->add(
                    'title',
                    TextField::class,
                    TextFieldOption::make()
                        ->label(__('Title'))
                        ->placeholder(__('Title'))
                )
                ->add(
                    'subtitle',
                    TextareaField::class,
                    TextareaFieldOption::make()
                        ->label(__('Subtitle'))
                        ->placeholder(__('Subtitle'))
                        ->rows(3)
                );
        });

        shortcode()->registerLoadingState('featured-news', Theme::getThemeNamespace('partials.short-codes.featured-news-skeleton'));
    }

    add_shortcode('video-introduction', __('Video Introduction'), __('Video Introduction'), function (Shortcode $shortcode) {
        Theme::asset()->usePath()->add('magnific-popup-css', 'css/magnific-popup.css');
        Theme::asset()->container('footer')->usePath()->add('jquery.magnific-popup', 'js/jquery.magnific-popup.min.js');

        return Theme::partial('short-codes.video-introduction', [
            'title' => $shortcode->title,
            'sub_title' => $shortcode->sub_title,
            'subtitle' => $shortcode->subtitle,
            'description' => $shortcode->description,
            'content' => $shortcode->content,
            'background_image' => $shortcode->background_image,
            'video_image' => $shortcode->video_image,
            'video_url' => $shortcode->video_url,
            'button_text' => $shortcode->button_text,
            'button_url' => $shortcode->button_url,
        ]);
    });

    shortcode()->setAdminConfig('video-introduction', function (array $attributes) {
        return ShortcodeForm::createFromArray($attributes)
            ->withLazyLoading()
            ->add(
                'title',
                TextField::class,
                TextFieldOption::make()
                    ->label(__('Title'))
                    ->placeholder(__('Title'))
            )
            ->add(
                'subtitle',
                TextareaField::class,
                TextareaFieldOption::make()
                    ->label(__('Subtitle'))
                    ->placeholder(__('Subtitle'))
                    ->rows(3)
            )
            ->add(
                'content',
                TextareaField::class,
                TextareaFieldOption::make()
                    ->label(__('Content'))
                    ->placeholder(__('Content'))
                    ->rows(3)
            )
            ->add(
                'background_image',
                MediaImageField::class,
                MediaImageFieldOption::make()
                    ->label(__('Background Image'))
            )
            ->add(
                'video_image',
                MediaImageField::class,
                MediaImageFieldOption::make()
                    ->label(__('Video Image'))
            )
            ->add(
                'video_url',
                TextField::class,
                TextFieldOption::make()
                    ->label(__('Video URL'))
                    ->placeholder(__('Video URL'))
            )
            ->add(
                'button_text',
                TextField::class,
                TextFieldOption::make()
                    ->label(__('Button text'))
                    ->placeholder(__('Button text'))
            )
            ->add(
                'button_url',
                TextField::class,
                TextFieldOption::make()
                    ->label(__('Button URL'))
                    ->placeholder(__('Button URL'))
            );
    });

    shortcode()->registerLoadingState('video-introduction', Theme::getThemeNamespace('partials.short-codes.video-introduction-skeleton'));

    add_shortcode('rooms-introduction', __('Rooms Introduction'), __('Rooms Introduction'), function (Shortcode $shortcode) {
        return Theme::partial('short-codes.rooms-introduction', [
            'title' => $shortcode->title,
            'description' => $shortcode->description,
            'subtitle' => $shortcode->subtitle,
            'background_image' => $shortcode->background_image,
            'first_image' => $shortcode->first_image,
            'second_image' => $shortcode->second_image,
            'third_image' => $shortcode->third_image,
            'button_text' => $shortcode->button_text,
            'button_url' => $shortcode->button_url,
        ]);
    });

    shortcode()->setAdminConfig('rooms-introduction', function (array $attributes) {
        return ShortcodeForm::createFromArray($attributes)
            ->withLazyLoading()
            ->add(
                'title',
                TextField::class,
                TextFieldOption::make()
                    ->label(__('Title'))
                    ->placeholder(__('Title'))
            )
            ->add(
                'subtitle',
                TextareaField::class,
                TextareaFieldOption::make()
                    ->label(__('Subtitle'))
                    ->placeholder(__('Subtitle'))
                    ->rows(3)
            )
            ->add(
                'background_image',
                MediaImageField::class,
                MediaImageFieldOption::make()
                    ->label(__('Background Image'))
            )
            ->add(
                'first_image',
                MediaImageField::class,
                MediaImageFieldOption::make()
                    ->label(__('First Image'))
            )
            ->add(
                'second_image',
                MediaImageField::class,
                MediaImageFieldOption::make()
                    ->label(__('Second Image'))
            )
            ->add(
                'third_image',
                MediaImageField::class,
                MediaImageFieldOption::make()
                    ->label(__('Third Image'))
            )
            ->add(
                'button_text',
                TextField::class,
                TextFieldOption::make()
                    ->label(__('Button text'))
                    ->placeholder(__('Button text'))
            )
            ->add(
                'button_url',
                TextField::class,
                TextFieldOption::make()
                    ->label(__('Button URL'))
                    ->placeholder(__('Button URL'))
            );
    });

    shortcode()->registerLoadingState('rooms-introduction', Theme::getThemeNamespace('partials.short-codes.rooms-introduction-skeleton'));

    add_shortcode('hotel-about', __('Hotel About'), __('Hotel About'), function (Shortcode $shortcode) {
        return Theme::partial('short-codes.hotel-about', [
            'title' => $shortcode->title,
            'description' => $shortcode->description,
            'subtitle' => $shortcode->subtitle,
            'block_icon_1' => $shortcode->block_icon_1,
            'block_text_1' => $shortcode->block_text_1,
            'block_link_1' => $shortcode->block_link_1,
            'block_icon_2' => $shortcode->block_icon_2,
            'block_text_2' => $shortcode->block_text_2,
            'block_link_2' => $shortcode->block_link_2,
            'block_icon_3' => $shortcode->block_icon_3,
            'block_text_3' => $shortcode->block_text_3,
            'block_link_3' => $shortcode->block_link_3,
            'block_icon_4' => $shortcode->block_icon_4,
            'block_text_4' => $shortcode->block_text_4,
            'block_link_4' => $shortcode->block_link_4,
            'block_icon_5' => $shortcode->block_icon_5,
            'block_text_5' => $shortcode->block_text_5,
            'block_link_5' => $shortcode->block_link_5,
        ]);
    });

    shortcode()->setAdminConfig('hotel-about', function (array $attributes) {
        $form = ShortcodeForm::createFromArray($attributes)
            ->withLazyLoading()
            ->add(
                'title',
                TextField::class,
                TextFieldOption::make()
                    ->label(__('Title'))
                    ->placeholder(__('Title'))
            )
            ->add(
                'subtitle',
                TextareaField::class,
                TextareaFieldOption::make()
                    ->label(__('Subtitle'))
                    ->placeholder(__('Subtitle'))
                    ->rows(3)
            );

        for ($i = 1; $i <= 5; $i++) {
            $form
                ->add(
                    'block_icon_' . $i,
                    CoreIconField::class,
                    [
                        'label' => __('Block icon :number', ['number' => $i]),
                    ]
                )
                ->add(
                    'block_text_' . $i,
                    TextField::class,
                    TextFieldOption::make()
                        ->label(__('Block text :number', ['number' => $i]))
                        ->placeholder(__('Block text :number', ['number' => $i]))
                )
                ->add(
                    'block_link_' . $i,
                    TextField::class,
                    TextFieldOption::make()
                        ->label(__('Block link :number', ['number' => $i]))
                        ->placeholder(__('Block link :number', ['number' => $i]))
                );
        }

        return $form;
    });

    shortcode()->registerLoadingState('hotel-about', Theme::getThemeNamespace('partials.short-codes.hotel-about-skeleton'));

    add_shortcode('contact-info', __('Contact information'), __('Contact information'), function () {
        return Theme::partial('short-codes.contact-info');
    });

    shortcode()->setAdminConfig('youtube-video', function (array $attributes) {
        return ShortcodeForm::createFromArray($attributes)
            ->withLazyLoading()
            ->add(
                'url',
                TextField::class,
                TextFieldOption::make()
                    ->label(__('YouTube URL'))
                    ->placeholder('https://www.youtube.com/watch?v=FN7ALfpGxiI')
            )
            ->add(
                'background_image',
                MediaImageField::class,
                MediaImageFieldOption::make()
                    ->label(__('Background Image'))
            );
    });

    shortcode()->registerLoadingState('youtube-video', Theme::getThemeNamespace('partials.short-codes.youtube-video-skeleton'));

    add_shortcode('home-banner', 'Home Banner', 'Home Banner', function (Shortcode $shortcode) {
        return Theme::partial('short-codes.home-banner', [
            'shortcode' => $shortcode,

        ]);
    });

    shortcode()->setAdminConfig('home-banner', function (array $attributes) {
        return ShortcodeForm::createFromArray($attributes)
            ->add(
                'option',
                SelectField::class,
                SelectFieldOption::make()
                    ->label(__('Use theme option sliders or use shortcode slider option in below?'))
                    ->choices([
                        'theme' => __('Theme option sliders'),
                        'code' => __('Shortcode slider option in below'),
                    ])
                    ->required()
            )
            ->add(
                'home_banner_tabs',
                ShortcodeTabsField::class,
                ShortcodeTabsFieldOption::make()
                    ->fields([
                        'title' => [
                            'title' => __('Title'),
                        ],
                        'image' => [
                            'type' => 'image',
                            'title' => __('Image'),
                        ],
                        'description' => [
                            'title' => __('Description'),
                        ],
                        'primary_button_text' => [
                            'title' => __('Slider action text'),
                            'placeholder' => __('Slider action text'),
                        ],
                        'primary_slider_button_url' => [
                            'title' => __('Slider learn more URL'),
                            'placeholder' => __('Learn more link'),
                        ],
                        'secondary_button_text' => [
                            'title' => __('Slider secondary button text'),
                            'placeholder' => __('Slider secondary button text'),
                        ],
                        'secondary_slider_button_url' => [
                            'title' => __('Slider secondary-button URL'),
                            'placeholder' => __('Learn more link'),
                        ],
                    ])
                    ->attrs($attributes)
            );
    });

    add_shortcode('rewrite-theme-option', 'Rewrite Theme Option', 'Rewrite Theme Option', function (Shortcode $shortcode) {
        return Theme::partial('short-codes.rewrite-theme-option', [
            'shortcode' => $shortcode,
        ]);
    });

    shortcode()->setAdminConfig('rewrite-theme-option', function (array $attributes) {
        return ShortcodeForm::createFromArray($attributes)
            ->add(
                'about_us',
                TextField::class,
                TextFieldOption::make()
                    ->label(__('About us'))
                    ->placeholder(__('About us'))
            )
            ->add(
                'hotline',
                TextField::class,
                TextFieldOption::make()
                    ->label(__('Hotline'))
                    ->placeholder(__('Hotline'))
            )
            ->add(
                'address',
                TextField::class,
                TextFieldOption::make()
                    ->label(__('Address'))
                    ->placeholder(__('Address'))
            )
            ->add(
                'email',
                TextField::class,
                TextFieldOption::make()
                    ->label(__('Email'))
                    ->placeholder(__('Email'))
            );
    });

    if (is_plugin_active('hotel')) {
        add_shortcode(
            'hotel-featured-features',
            __('Hotel Featured Features'),
            __('Hotel Featured Features'),
            function (Shortcode $shortcode) {
                $features = Feature::query()
                    ->wherePublished()
                    ->where('is_featured', true)
                    ->get();

                return Theme::partial('short-codes.hotel-featured-features', [
                    'title' => $shortcode->title,
                    'description' => $shortcode->description,
                    'subtitle' => $shortcode->subtitle,
                    'button_text' => $shortcode->button_text,
                    'button_url' => $shortcode->button_url,
                    'features' => $features,
                ]);
            }
        );

        shortcode()->setAdminConfig('hotel-featured-features', function (array $attributes) {
            return ShortcodeForm::createFromArray($attributes)
                ->withLazyLoading()
                ->add(
                    'title',
                    TextField::class,
                    TextFieldOption::make()
                        ->label(__('Title'))
                        ->placeholder(__('Title'))
                )
                ->add(
                    'subtitle',
                    TextareaField::class,
                    TextareaFieldOption::make()
                        ->label(__('Subtitle'))
                        ->placeholder(__('Subtitle'))
                        ->rows(3)
                )
                ->add(
                    'description',
                    TextareaField::class,
                    TextareaFieldOption::make()
                        ->label(__('Description'))
                        ->placeholder(__('Description'))
                        ->rows(3)
                )
                ->add(
                    'button_text',
                    TextField::class,
                    TextFieldOption::make()
                        ->label(__('Button text'))
                        ->placeholder(__('Button text'))
                )
                ->add(
                    'button_url',
                    TextField::class,
                    TextFieldOption::make()
                        ->label(__('Button URL'))
                        ->placeholder(__('Button URL'))
                );
        });

        shortcode()->registerLoadingState('hotel-featured-features', Theme::getThemeNamespace('partials.short-codes.hotel-featured-features-skeleton'));

        add_shortcode('rooms', __('Rooms'), __('Rooms'), function (Shortcode $shortcode) {
            $rooms = Room::query()
                ->wherePublished()
                ->with(['slugable'])
                ->get();

            return Theme::partial('short-codes.rooms', compact('shortcode', 'rooms'));
        });

        shortcode()->setAdminConfig('rooms', function (array $attributes) {
            $rooms = Room::query()
                ->wherePublished()
                ->with(['slugable'])
                ->get();

            $form = ShortcodeForm::createFromArray($attributes)
                ->withLazyLoading();

            foreach ($rooms as $room) {
                $form->add(
                    'icon_room_' . $room->id,
                    CoreIconField::class,
                    [
                        'label' => __('Icon for :room', ['room' => $room->name]),
                    ]
                );
            }

            return $form;
        });

        shortcode()->registerLoadingState('rooms', Theme::getThemeNamespace('partials.short-codes.rooms-skeleton'));

        add_shortcode('room-categories', __('Room Categories'), __('Room Categories'), function (Shortcode $shortcode) {
            $categories = RoomCategory::query()
                ->wherePublished()
                ->where('is_featured', true)
                ->with([
                    'rooms' => function ($query): void {
                        $query
                            ->latest()
                            ->with(['slugable'])
                            ->wherePublished();
                    },
                    'rooms.slugable',
                ])
                ->orderBy('order')
                ->get();

            return Theme::partial('short-codes.room-categories', [
                'title' => $shortcode->title,
                'sub_title' => $shortcode->sub_title,
                'subtitle' => $shortcode->subtitle,
                'background_image' => $shortcode->background_image,
                'categories' => $categories,
            ]);
        });

        shortcode()->setAdminConfig('room-categories', function (array $attributes) {
            return ShortcodeForm::createFromArray($attributes)
                ->withLazyLoading()
                ->add(
                    'title',
                    TextField::class,
                    TextFieldOption::make()
                        ->label(__('Title'))
                        ->placeholder(__('Title'))
                )
                ->add(
                    'sub_title',
                    TextField::class,
                    TextFieldOption::make()
                        ->label(__('Sub Title'))
                        ->placeholder(__('Sub Title'))
                )
                ->add(
                    'subtitle',
                    TextareaField::class,
                    TextareaFieldOption::make()
                        ->label(__('Subtitle'))
                        ->placeholder(__('Subtitle'))
                        ->rows(3)
                )
                ->add(
                    'background_image',
                    MediaImageField::class,
                    MediaImageFieldOption::make()
                        ->label(__('Background Image'))
                );
        });

        shortcode()->registerLoadingState('room-categories', Theme::getThemeNamespace('partials.short-codes.room-categories-skeleton'));

        add_shortcode('food-types', __('Food Types'), __('Food Types'), function () {
            $foodTypes = FoodType::query()
                ->wherePublished()
                ->with(['foods'])
                ->get();

            return Theme::partial('short-codes.food-types', compact('foodTypes'));
        });

        add_shortcode('foods', __('Foods'), __('Foods'), function (Shortcode $shortcode) {
            $foods = Food::query()
                ->wherePublished()
                ->with(['type'])
                ->get();

            return Theme::partial('short-codes.foods', [
                'title' => $shortcode->title,
                'sub_title' => $shortcode->sub_title,
                'subtitle' => $shortcode->subtitle,
                'foods' => $foods,
            ]);
        });

        shortcode()->setAdminConfig('foods', function (array $attributes) {
            return ShortcodeForm::createFromArray($attributes)
                ->withLazyLoading()
                ->add(
                    'title',
                    TextField::class,
                    TextFieldOption::make()
                        ->label(__('Title'))
                        ->placeholder(__('Title'))
                )
                ->add(
                    'sub_title',
                    TextField::class,
                    TextFieldOption::make()
                        ->label(__('Sub Title'))
                        ->placeholder(__('Sub Title'))
                )
                ->add(
                    'subtitle',
                    TextareaField::class,
                    TextareaFieldOption::make()
                        ->label(__('Subtitle'))
                        ->placeholder(__('Subtitle'))
                        ->rows(3)
                );
        });

        shortcode()->registerLoadingState('foods', Theme::getThemeNamespace('partials.short-codes.foods-skeleton'));

        add_shortcode(
            'hotel-core-features',
            __('Hotel Core Features'),
            __('Hotel Core Features'),
            function (Shortcode $shortcode) {
                $features = Feature::query()
                    ->wherePublished()
                    ->get();

                return Theme::partial('short-codes.hotel-core-features', [
                    'title' => $shortcode->title,
                    'sub_title' => $shortcode->sub_title,
                    'subtitle' => $shortcode->subtitle,
                    'features' => $features,
                ]);
            }
        );

        shortcode()->setAdminConfig('hotel-core-features', function (array $attributes) {
            return ShortcodeForm::createFromArray($attributes)
                ->withLazyLoading()
                ->add(
                    'title',
                    TextField::class,
                    TextFieldOption::make()
                        ->label(__('Title'))
                        ->placeholder(__('Title'))
                )
                ->add(
                    'sub_title',
                    TextField::class,
                    TextFieldOption::make()
                        ->label(__('Sub Title'))
                        ->placeholder(__('Sub Title'))
                )
                ->add(
                    'subtitle',
                    TextareaField::class,
                    TextareaFieldOption::make()
                        ->label(__('Subtitle'))
                        ->placeholder(__('Subtitle'))
                        ->rows(3)
                );
        });

        shortcode()->registerLoadingState('hotel-core-features', Theme::getThemeNamespace('partials.short-codes.hotel-core-features-skeleton'));

        add_shortcode(
            'check-availability-form',
            __('Check Availability Form'),
            __('Check Availability Form'),
            function () {
                return Theme::partial('short-codes.check-availability-form');
            }
        );

        add_shortcode('our-offers', __('Our offers'), __('Our offers'), function () {
            $dateFormat = 'Y-m-d';

            $condition = [
                'start_date' => Carbon::now()->format($dateFormat),
                'end_date' => Carbon::now()->addDay()->format($dateFormat),
                'adults' => 1,
            ];

            $allRooms = Room::query()
                ->wherePublished()
                ->where('is_featured', true)
                ->with([
                    'slugable',
                    'amenities',
                    'category',
                    'activeBookingRooms' => function ($query) use ($condition, $dateFormat) {
                        return $query
                            ->whereDate('start_date', '<=', date($dateFormat, strtotime($condition['start_date'])))
                            ->whereDate('end_date', '>=', date($dateFormat, strtotime($condition['end_date'])));
                    },
                    'activeRoomDates' => function ($query) use ($condition, $dateFormat) {
                        return $query
                            ->whereDate('start_date', '>=', date($dateFormat, strtotime($condition['start_date'])))
                            ->whereDate('end_date', '<=', date($dateFormat, strtotime($condition['end_date'])))
                            ->take(40);
                    },
                ])
                ->get();

            $nights = 1;

            $rooms = [];
            foreach ($allRooms as $allRoom) {
                if ($allRoom->isAvailableAt($condition)) {
                    $allRoom->total_price = $allRoom->getRoomTotalPrice(
                        $condition['start_date'],
                        $condition['end_date'],
                        $nights
                    );
                    $rooms[] = $allRoom;
                }
            }

            return Theme::partial('short-codes.our-offers', compact('rooms'));
        });

        shortcode()->registerLoadingState('our-offers', Theme::getThemeNamespace('partials.short-codes.our-offers-skeleton'));

        add_shortcode('all-rooms', __('All Rooms'), __('Display all rooms'), function () {
            $params = RoomSearchParams::fromRequest(request()->input());

            $rooms = app(GetRoomService::class)->getAvailableRooms($params);
            $nights = $params->endDate->diffInDays($params->startDate);

            return Theme::partial('short-codes.all-rooms', compact('rooms', 'nights'));
        });

        shortcode()->setAdminConfig('all-rooms', function (array $attributes) {
            return ShortcodeForm::createFromArray($attributes)
                ->withLazyLoading();
        });

        shortcode()->registerLoadingState('all-rooms', Theme::getThemeNamespace('partials.short-codes.all-rooms-skeleton'));
    }

    if (is_plugin_active('gallery')) {
        add_shortcode('all-galleries', __('All Galleries'), __('All Galleries'), function (Shortcode $shortcode) {
            $galleries = Gallery::query()
                ->wherePublished()
                ->with(['slugable'])
                ->get();

            return Theme::partial('short-codes.all-galleries', [
                'title' => $shortcode->title,
                'sub_title' => $shortcode->sub_title,
                'subtitle' => $shortcode->subtitle,
                'galleries' => $galleries,
            ]);
        });

        shortcode()->setAdminConfig('all-galleries', function (array $attributes) {
            return ShortcodeForm::createFromArray($attributes)
                ->withLazyLoading()
                ->add(
                    'title',
                    TextField::class,
                    TextFieldOption::make()
                        ->label(__('Title'))
                        ->placeholder(__('Title'))
                )
                ->add(
                    'sub_title',
                    TextField::class,
                    TextFieldOption::make()
                        ->label(__('Sub Title'))
                        ->placeholder(__('Sub Title'))
                )
                ->add(
                    'subtitle',
                    TextareaField::class,
                    TextareaFieldOption::make()
                        ->label(__('Subtitle'))
                        ->placeholder(__('Subtitle'))
                        ->rows(3)
                );
        });

        shortcode()->registerLoadingState('all-galleries', Theme::getThemeNamespace('partials.short-codes.all-galleries-skeleton'));

        add_shortcode('places', __('Places'), __('Places'), function () {
            $places = Place::query()
                ->wherePublished()
                ->get();

            return Theme::partial('short-codes.places', [
                'places' => $places,
            ]);
        });

        shortcode()->registerLoadingState('places', Theme::getThemeNamespace('partials.short-codes.places-skeleton'));
    }

    if (is_plugin_active('contact')) {
        add_filter(CONTACT_FORM_TEMPLATE_VIEW, function () {
            return Theme::getThemeNamespace() . '::partials.short-codes.contact-form';
        }, 120);

        add_shortcode('contact-home', __('Contact Home Page'), __('Contact Home Page'), function (Shortcode $shortcode) {
            return Theme::partial('short-codes.contact-form-homepage', compact('shortcode'));
        });

        shortcode()->setAdminConfig('contact-home', function (array $attributes) {
            return ShortcodeForm::createFromArray($attributes)
                ->withLazyLoading()
                ->add(
                    'title',
                    TextField::class,
                    TextFieldOption::make()
                        ->label(__('Title'))
                        ->placeholder(__('Title'))
                )
                ->add(
                    'subtitle',
                    TextareaField::class,
                    TextareaFieldOption::make()
                        ->label(__('Subtitle'))
                        ->placeholder(__('Subtitle'))
                        ->rows(3)
                )
                ->add(
                    'block',
                    SelectField::class,
                    SelectFieldOption::make()
                        ->label(__('Block'))
                        ->choices([
                            'map' => __('Map'),
                            'image' => __('Image'),
                        ])
                        ->defaultValue('map')
                )
                ->add(
                    'address',
                    TextField::class,
                    TextFieldOption::make()
                        ->label(__('Address'))
                        ->placeholder(__('Address'))
                )
                ->add(
                    'image',
                    MediaImageField::class,
                    MediaImageFieldOption::make()
                        ->label(__('Image'))
                );
        });

        shortcode()->registerLoadingState('contact-home', Theme::getThemeNamespace('partials.short-codes.contact-home-skeleton'));
    }

    if (is_plugin_active('newsletter')) {
        add_shortcode('newsletter', __('Newsletter'), __('Newsletter'), function (Shortcode $shortcode) {
            return Theme::partial('short-codes.newsletter', compact('shortcode'));
        });

        shortcode()->setAdminConfig('newsletter', function (array $attributes) {
            return ShortcodeForm::createFromArray($attributes)
                ->withLazyLoading()
                ->add(
                    'name',
                    TextField::class,
                    TextFieldOption::make()
                        ->label(__('Name'))
                        ->placeholder(__('Name'))
                )
                ->add(
                    'title',
                    TextField::class,
                    TextFieldOption::make()
                        ->label(__('Title'))
                        ->placeholder(__('Title'))
                )
                ->add(
                    'description',
                    TextareaField::class,
                    TextareaFieldOption::make()
                        ->label(__('Subtitle'))
                        ->placeholder(__('Subtitle'))
                        ->rows(3)
                )
                ->add(
                    'image',
                    MediaImageField::class,
                    MediaImageFieldOption::make()
                        ->label(__('Image'))
                );
        });

        shortcode()->registerLoadingState('newsletter', Theme::getThemeNamespace('partials.short-codes.newsletter-skeleton'));
    }
});
