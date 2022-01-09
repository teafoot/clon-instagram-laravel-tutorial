@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                @include('includes.message')
                @foreach($images as $image)
                    @include('includes.image', ['image' => $image])
                @endforeach
                <div class="clearfix"></div>
                {{$images->links()}} <!-- method of laravel to generate pagination links -->
            </div>
        </div>
    </div>
@endsection
