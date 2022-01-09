<?php

namespace App\Http\Controllers;

use App\Comment;
use Illuminate\Http\Request;

class CommentController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function save(Request $request)
    {
        $validate = $this->validate($request, [
            'image_id' => 'integer|required',
            'content' => 'string|required'
        ]);

        $image_id = $request->input('image_id');
        $content = $request->input('content');

        $user = \Auth::user();

        $comment = new Comment();
        $comment->user_id = $user->id;
        $comment->image_id = $image_id;
        $comment->content = $content;

        $comment->save();

        return redirect()->route('image.detail', ['id' => $image_id])
            ->with(['message' => 'Has publicado tu comentario correctamente']);
    }

    public function delete($id) {
        $user = \Auth::user();
        $comment = Comment::find($id);

        // Comprobar si soy el dueño del comentario o de la publicación (imagen)
        if($user && ($comment->user_id == $user->id || $comment->image->user_id == $user->id)){
            $comment->delete();

            return redirect()->route('image.detail', ['id' => $comment->image->id]) // redireccionar a la publicacion (imagen)
                ->with(['message' => 'Comentario eliminado correctamente']);
        } else {
            return redirect()->route('image.detail', ['id' => $comment->image->id])
                ->with(['message' => 'El comentario no se ha eliminado']);
        }
    }
}
