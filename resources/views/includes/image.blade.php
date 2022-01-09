<div class="card pub_image">
    <div class="card-header">
        @if($image->user->image)
            <div class="container-avatar">
                <img src="{{route('user.avatar', ['filename' => $image->user->image])}}" alt=""
                     class="avatar">
            </div>
        @endif
        <div class="data-user">
            <a href="{{route('profile', ['id' => $image->user->id])}}">
                {{$image->user->name.' '.$image->user->surname}}
                <span class="nickname">
                    {{' | @'.$image->user->nick}}
                </span>
            </a>
        </div>
    </div>
    <div class="card-body">
        <div class="image-container">
            <img src="{{route('image.file', ['filename' => $image->image_path])}}" alt="">
        </div>
        <div class="description">
            <span class="nickname">{{'@'.$image->user->nick}}</span>
            <span class="nickname date">{{' | '.\FormatTime::LongTimeFilter($image->created_at)}}</span>
            <p>{{$image->description}}</p>
        </div>
        <div class="likes">
            <!-- Comprobar si el usuario le dio like a la imagen -->
            <?php $user_liked = false; ?>
            @foreach($image->likes as $like)
                @if($like->user->id == Auth::user()->id)
                    <?php $user_liked = true; ?>
                @endif
            @endforeach
            @if($user_liked)
                <img src="{{asset('img/heart-red.png')}}" data-id="{{$image->id}}" class="btn-dislike"/>
            @else
                <img src="{{asset('img/heart-black.png')}}" data-id="{{$image->id}}" class="btn-like"/>
            @endif
            <span class="number_likes">{{count($image->likes)}}</span>
        </div>
        <div class="comments">
            <a href="{{route('image.detail', ['id' => $image->id])}}" class="btn btn-sm btn-warning btn-comments">
                Comentarios ({{count($image->comments)}})
            </a>
        </div>
        {{--                        @if (session('status'))--}}
        {{--                            <div class="alert alert-success" role="alert">--}}
        {{--                                {{ session('status') }}--}}
        {{--                            </div>--}}
        {{--                        @endif--}}
    </div>
</div>
