<?php

namespace App\Http\Controllers;
use App\Repositories\ArtistRepositoryInterface;
use Illuminate\Http\Request;

class ArtistController extends Controller
{
    //
    public function __construct(protected ArtistRepositoryInterface $artistrepo) {
        $this->artistrepo = $artistrepo;
    }
    public function index(Request $request) {
        $data = $this->artistrepo->getUserPagination($request->all());
        return response()->json($data,200);
    }

    public function create(Request $request) {
        
        return response()->json([
            'message'=>"Artist successfully added"
        ],200);
    }
    public function update(Request $request){
       
        return response()->json([
            'message'=>"Artist successfully updated"
        ],200);
    }
    public function delete(Request $request){
       
        return response()->json([
            'message'=>"Artist successfully deleted"
        ],200);
    }
}
