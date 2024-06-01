<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return ['Laravel' => app()->version()];
});
Route::get('api/get-users', [UserController::class,'index']);
Route::post('api/user-create', [UserController::class,'create']);
Route::put('api/user-update/{id}', [UserController::class,'update']);
Route::delete('api/user-delete/{id}', [UserController::class,'delete']);

