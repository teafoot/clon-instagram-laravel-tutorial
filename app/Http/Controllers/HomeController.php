<?php

namespace App\Http\Controllers;

use App\Image;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
//     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $images = Image::orderBy('id', 'desc')->paginate(5);
//        $images = Image::orderBy('id', 'desc')->get();

        return view('home', [
            'images' => $images
        ]);
    }
}
