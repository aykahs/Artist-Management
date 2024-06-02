<?php

namespace App\Http\Controllers;
use App\Repositories\ArtistRepositoryInterface;
use Illuminate\Http\Request;
use App\Http\Requests\ArtistRequest;

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

    public function create(ArtistRequest $request) {
        $this->artistrepo->create($request->validated());
        return response()->json([
            'message'=>"Artist successfully added"
        ],200);
    }
    public function update(ArtistRequest $request,$id){
        $this->artistrepo->update($request->validated(),$id);
        return response()->json([
            'message'=>"Artist successfully updated"
        ],200);
    }
    public function delete($id){
        $this->artistrepo->delete($id);
        return response()->json([
            'message'=>"Artist successfully deleted"
        ],200);
    }
}
