<?php

namespace App\Livewire;

use App\Models\User;
use Livewire\Component;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Session;
use PHPOpenSourceSaver\JWTAuth\Facades\JWTAuth;

class LoginForm extends Component
{
    public $email = '';
    public $password = '';
    public $errorMessage = '';

    public function login()
    {
        $this->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);

        try {
            $user = User::where('email', $this->email)
                ->first();

            // Jika pengguna ditemukan dan password cocok
            if ($user && Hash::check($this->password, $user->password)) {
                // Menghasilkan token JWT untuk pengguna
                $token = JWTAuth::fromUser($user);

                // Menyimpan token ke sesi
                Session::put('jwt_token', $token);

                // Mengarahkan ke halaman home
                return redirect()->route('home');
            } else {
                // Kredensial tidak valid
                $this->errorMessage = 'Mohon periksa kembali email & password Anda!';
            }
        } catch (\Exception $e) {
            // Menangani kesalahan
            Log::error('Terjadi kesalahan: ' . $e->getMessage());
            $this->errorMessage = 'Terjadi kesalahan: ' . $e->getMessage();
        }
    }

    public function render()
    {
        return view('livewire.login-form');
    }
}
