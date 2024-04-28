<?php

use App\Livewire\Home;
use App\Livewire\LoginForm;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Route::middleware(['cors'])->group(function () {
    Route::post('/login', [LoginForm::class, 'login']);
});

Route::get('/home', Home::class)->name('home');
