<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Repositories\UserRepositoryInterface;
use App\Http\Requests\UserRequest;
use Illuminate\Support\Facades\Auth;
class UserController extends Controller
{
    //
    public function __construct(protected UserRepositoryInterface $userRepository) {
        $this->userRepository = $userRepository;
    }
    public function index(Request $request) {
       $data = $this->userRepository->getUserPagination($request->all());
        return response()->json($data,200);

    }

    public function create(UserRequest $request) {
        $this->userRepository->create($request->validated());
        return response()->json([
            'message'=>"User successfully added"
        ],200);
    }
    public function register(UserRequest $request) {
        $this->userRepository->register($request->validated());
        return response()->json([
            'message'=>"User successfully added"
        ],200);
    }
    public function update(UserRequest $request,$id){
        $this->userRepository->update($request->validated(),$id);
        return response()->json([
            'message'=>"User successfully updated"
        ],200);
    }
    public function delete($id){
        $this->userRepository->delete($id);
        return response()->json([
            'message'=>"User successfully deleted"
        ],200);
    }


}
