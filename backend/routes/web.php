<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\ArtistController;
use App\Http\Controllers\MusicController;


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


Route::post('api/login', [AuthController::class, 'login']);
Route::post('api/register', [UserController::class, 'register']);

Route::middleware('auth:api')->group(function () {
    Route::get('api/get-users', [UserController::class, 'index']);
    Route::post('api/user-create', [UserController::class, 'create']);
    Route::put('api/user-update/{id}', [UserController::class, 'update']);
    Route::delete('api/user-delete/{id}', [UserController::class, 'delete']);

    Route::get('api/get-artist-list', [ArtistController::class, 'index']);
    Route::post('api/artist-create', [ArtistController::class, 'create']);
    Route::put('api/artist-update/{id}', [ArtistController::class, 'update']);
    Route::delete('api/artist-delete/{id}', [ArtistController::class, 'delete']);
    
    Route::get('api/get-music-list/{artist_id}', [MusicController::class, 'index']);
    Route::post('api/music-create', [MusicController::class, 'create']);
    Route::put('api/music-update/{id}', [MusicController::class, 'update']);
    Route::delete('api/music-delete/{id}/{artist_id}', [MusicController::class, 'delete']);
    Route::get('api/artist-excel', [ArtistController::class, 'excel']);
    Route::post('api/artist-import', [ArtistController::class, 'import']);
    Route::get('api/dashboard', [ArtistController::class, 'dashboard']);

    Route::post('api/logout', [AuthController::class, 'logout']);
    Route::get('api/user', [AuthController::class, 'user']);
});
