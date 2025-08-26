<?php

return [
    'name' => 'Hotel',
    'booking_name' => 'Booking name',
    'booking_email' => 'Booking email',
    'booking_phone' => 'Booking phone',
    'booking_address' => 'Booking address',
    'booking_request' => 'Booking request',
    'booking_link' => 'Booking link',
    'booking_date' => 'Booking date',
    'booking_status' => 'Booking status',
    'reviews' => 'Reviews',
    'shortcodes' => [
        'title' => 'Title',
        'choose_services' => 'Choose Services',
        'choose_places' => 'Choose Places',
    ],

    'login_form' => 'Login Form',
    'register_form' => 'Register Form',
    'forgot_password_form' => 'Forgot Password Form',
    'reset_password_form' => 'Reset Password Form',

    'email_templates' => [
        'booking_confirmation' => [
            'greeting' => 'Hello, Thanks for booking rooms from :site_title:',
            'field_name' => 'From',
            'field_email' => 'Email',
            'field_phone' => 'Phone',
            'field_address' => 'Address',
            'field_request' => 'Message',
            'view_booking_detail' => 'View booking detail',
        ],
        'booking_notice_to_admin' => [
            'greeting' => 'Hello, there is a new booking from :site_title:',
            'field_name' => 'From',
            'field_email' => 'Email',
            'field_phone' => 'Phone',
            'field_address' => 'Address',
            'field_request' => 'Message',
            'view_booking_detail' => 'View booking detail',
        ],
        'booking_status_changed' => [
            'greeting' => 'Hello, Thanks for booking rooms from :site_title:',
            'message' => 'We hope this message finds you well. We wanted to inform you that there has been a recent update regarding your booking with us. Your booking status has undergone a change, and we wanted to keep you in the loop.',
            'booking_details_title' => 'Booking Details',
            'field_name' => 'Name',
            'field_date_of_booking' => 'Date of Booking',
            'view_booking_detail' => 'View booking detail',
            'new_booking_status' => 'New Booking Status',
        ],
    ],
];
