<?php

namespace App\Http\Controllers;

use App\Comment;
use App\Image;
use App\Like;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;

class ImageController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function create()
    {
        return view('image.create');
    }

    public function save(Request $request)
    {
        $validate = $this->validate($request, [
            'description' => 'required',
            'image_path' => 'required|mimes:jpeg,bmp,png,jpg,gif'
//            'image_path' => 'required|image' // no funciona, que raro
        ]);

        $description = $request->input('description');
        $image_path = $request->file('image_path');

        $user = Auth::user();
        //
        $image = new Image();
        $image->user_id = $user->id;
        $image->description = $description;

        if ($image_path) {
            $image_path_name = time() . $image_path->getClientOriginalName();
            Storage::disk('images')->put($image_path_name, File::get($image_path));
            $image->image_path = $image_path_name;
        }

        $image->save();

        return redirect()->route('home')->with([
            'message' => 'La foto ha sido subida correctamente'
        ]);
    }

    public function getImage($filename)
    {
        $file = Storage::disk('images')->get($filename);
        return new Response($file, 200);
    }

    public function detail($id)
    {
        $image = Image::find($id);

        return view('image.detail', [
            'image' => $image
        ]);
    }

    public function delete($id)
    {
        $user = \Auth::user();
        $image = Image::find($id);
        // eliminar la imagen, los comentarios y likes asociados a la imagen subida
        $comments = Comment::where('image_id', $id)->get();
        $likes = Like::where('image_id', $id)->get();

        if ($user && $image && $image->user->id == $user->id) {
            if ($comments && count($comments) > 0) {
                foreach ($comments as $comment) {
                    $comment->delete();
                }
            }
            if ($likes && count($likes) > 0) {
                foreach ($likes as $like) {
                    $like->delete();
                }
            }
            $image->delete();

            Storage::disk('images')->delete($image->image_path);

            $message = array('message' => 'La imagen se ha borrado correctamente.');
        } else {
            $message = array('message' => 'La imagen no se ha borrado.');
        }

        return redirect()->route('home')->with($message);
    }

    public function edit($id)
    {
        $user = \Auth::user();
        $image = Image::find($id);

        if ($user && $image && $image->user->id == $user->id) {
            return view('image.edit', ['image' => $image]);
        } else {
            return redirect()->route('home');
        }
    }

    public function update(Request $request)
    {
        $validate = $this->validate($request, [
            'description' => 'required',
            'image_path' => 'mimes:jpeg,bmp,png,jpg,gif',
//            'image_path' => 'image', // no funciona, que raro
        ]);

        $image_id = $request->input('image_id');
        $description = $request->input('description');
        $image_path = $request->file('image_path');

        $image = Image::find($image_id);
        $image->description = $description;
        // Subir fichero
        if ($image_path) {
            $image_path_name = time() . $image_path->getClientOriginalName();
            Storage::disk('images')->put($image_path_name, File::get($image_path));
            $image->image_path = $image_path_name;
        }

        $image->update();

        return redirect()->route('image.detail', ['id' => $image_id])
            ->with(['message' => 'Imagen actualizada con exito']);
    }
}
