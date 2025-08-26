{!! $form->setFormOption('class', 'contact-form')->setFormInputClass(' ')->setFormInputWrapperClass('input-group mt-30')->modify(
        'name',
        \Botble\Base\Forms\Fields\TextField::class,
        \Botble\Base\Forms\FieldOptions\TextFieldOption::make()->prepend(
            '<span class="icon"><i class="far fa-user"></i></span>',
        ),
    )->modify(
        'email',
        \Botble\Base\Forms\Fields\EmailField::class,
        \Botble\Base\Forms\FieldOptions\EmailFieldOption::make()->prepend(
            '<span class="icon"><i class="far fa-envelope"></i></span>',
        ),
    )->modify(
        'address',
        \Botble\Base\Forms\Fields\TextField::class,
        \Botble\Base\Forms\FieldOptions\TextFieldOption::make()->prepend(
            '<span class="icon"><i class="fal fa-map-marker-alt"></i></span>',
        ),
    )->modify(
        'phone',
        \Botble\Base\Forms\Fields\TextField::class,
        \Botble\Base\Forms\FieldOptions\TextFieldOption::make()->prepend(
            '<span class="icon"><i class="fa fa-phone"></i></span>',
        ),
    )->modify(
        'subject',
        \Botble\Base\Forms\Fields\TextField::class,
        \Botble\Base\Forms\FieldOptions\TextFieldOption::make()->prepend(
            '<span class="icon"><i class="far fa-book"></i></span>',
        ),
    )->modify(
        'content',
        \Botble\Base\Forms\Fields\TextareaField::class,
        \Botble\Base\Forms\FieldOptions\TextareaFieldOption::make()->prepend(
            '<span class="icon textarea-icon"><i class="far fa-pen"></i></span>',
        ),
    )->modify(
        'submit',
        'submit',
        Botble\Base\Forms\FieldOptions\ButtonFieldOption::make()->cssClass('main-btn btn-filled')->label(__('Get Free Quote'))->wrapperAttributes(['class' => 'input-group mt-30 mb-30'])->toArray(),
        true,
    )->renderForm() !!}
