<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\BlogController;

Route::post('register', [AuthController::class, 'register']);
Route::post('login', [AuthController::class, 'login']);

Route::group([
    'middleware' => ["auth:api"],
], function () {
    // profile
    Route::get('me', [AuthController::class, 'me']);
    // logout
    Route::get('logout', [AuthController::class, 'logout']);

    // blog
    Route::get('blogs', [BlogController::class, 'index'])->name('blogs');
    Route::post('blogs', [BlogController::class, 'store']);
    Route::put('blogs/{id}', [BlogController::class, 'update']);
    Route::delete('blogs/{id}', [BlogController::class, 'delete']);
});
