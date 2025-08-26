<section class="breadcrumb-area" style="background-image: url({{ theme_option('news_banner') ? RvMedia::getImageUrl(theme_option('news_banner')) : Theme::asset()->url('img/bg/banner.jpg') }});">
    <div class="container">
        <div class="breadcrumb-text">
            <span>{{ $post->name }}</span>
            <h2 class="page-title">{{ __('News Details') }}</h2>

            {!! Theme::partial('breadcrumb') !!}
        </div>
    </div>
</section>
<section class="blog-section pt-120 pb-120">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="news-details-box">
                    <div class="entry-content">
                        @if (!$post->categories->isEmpty())
                            @foreach($post->categories as $category)
                                <a href="{{ $category->url }}" class="cat">{{ $category->name }}</a>
                            @endforeach
                        @endif
                        <h2 class="title">{{ $post->name }}</h2>
                        <ul class="post-meta">
                            <li><a href="{{ $post->url }}"><i class="fal fa-user"></i>{{ $post->author->name }}</a></li>
                            <li><a href="{{ $post->url }}"><i class="fal fa-calendar-alt"></i>{{ Theme::formatDate($post->created_at) }}</a></li>
                            <li><a href="{{ $post->url }}"><i class="far fa-eye"></i>{{ number_format($post->views) }} {{ __('Views') }}</a></li>
                        </ul>
                        <div class="mb-30">
                            <div class="ck-content">{!! BaseHelper::clean($post->content) !!}</div>
                        </div>
                    </div>
                    <div class="entry-footer">
                        <div class="tag-and-share mt-50 mb-50 d-md-flex align-items-center">
                            @if (!$post->tags->isEmpty())
                                <div class="tag">
                                    <h5>{{ __('Related Tags') }}</h5>
                                    <ul>
                                        @foreach ($post->tags as $tag)
                                        <li><a href="{{ $tag->url }}">{{ $tag->name }}</a></li>
                                        @endforeach
                                    </ul>
                                </div>
                            @endif
                        </div>
                        <div class="d-flex align-items-center mb-30">
                            <h5>{{ __('Social Share') }}: &nbsp;</h5>

                            {!! Theme::renderSocialSharing($post->url, SeoHelper::getDescription(), $post->image) !!}
                        </div>

                        <br>
                        {!! apply_filters(BASE_FILTER_PUBLIC_COMMENT_AREA, null, $post) !!}

                        @php $relatedPosts = get_related_posts($post->id, 2); @endphp

                        @if ($relatedPosts->count())
                            <div class="related-post mt-50">
                                <h3 class="mb-30">{{ __('Related Posts') }}</h3>
                                <div class="row">
                                @foreach ($relatedPosts as $relatedItem)
                                        <div class="col-md-6">
                                            <div class="related-post-box mb-50">
                                                <div class="thumb"
                                                     style="background-image: url({{ RvMedia::getImageUrl($relatedItem->image, null, false, RvMedia::getDefaultImage()) }});">
                                                </div>
                                                <div class="desc">
                                                    <a href="{{ $relatedItem->url }}" class="date"><i class="far fa-calendar-alt"></i>{{ Theme::formatDate($relatedItem->created_at) }}</a>
                                                    <h4><a href="{{ $relatedItem->url }}">{{ $relatedItem->name }}</a></h4>
                                                    <p>{{ $relatedItem->description }}</p>
                                                </div>
                                            </div>
                                        </div>
                                    @endforeach
                                </div>
                            </div>
                        @endif
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-8 col-sm-10">
                <div class="sidebar">
                    {!! dynamic_sidebar('primary_sidebar') !!}
                </div>
            </div>
        </div>
    </div>
</section>
