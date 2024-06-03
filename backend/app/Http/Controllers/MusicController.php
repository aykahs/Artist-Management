<?php

namespace App\Http\Controllers;
use App\Repositories\MusicRepositoryInterface;

use Illuminate\Http\Request;
use App\Http\Requests\MusicRequest;

class MusicController extends Controller
{
    //
    public function __construct(protected MusicRepositoryInterface $musicRepo) {
        $this->musicRepo = $musicRepo;
    }
    public function index(Request $request,$artist_id) {
        $data = $this->musicRepo->getUserPagination($request->all(),$artist_id);
        return response()->json($data,200);
    }

    public function create(MusicRequest $request) {
        $this->musicRepo->create($request->validated());
        return response()->json([
            'message'=>"Music successfully added"
        ],200);
    }
    public function update(MusicRequest $request,$id){
        $this->musicRepo->update($request->validated(),$id);
        return response()->json([
            'message'=>"Music successfully updated"
        ],200);
    }
    public function delete($id,$artist_id){
        $this->musicRepo->delete($id,$artist_id);
        return response()->json([
            'message'=>"Music successfully deleted"
        ],200);
    }
}
