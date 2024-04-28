<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\DB;
use PHPOpenSourceSaver\JWTAuth\Facades\JWTAuth;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        $request->validate([
            "username" => [
                "required",
                "string",
                "regex:/^\S*$/",
                Rule::unique('users')->where(function ($query) use ($request) {
                    return $query->where('username', $request->username);
                }),
            ],
            "email" => "required|string|unique:users",
            "password" => "required|min:4|confirmed",
            "gender" => ["required", "string", Rule::in(["L", "P"])],
        ], [
            "username.regex" => "Username tidak boleh mengandung spasi.",
        ]);

        $currentTime = now();

        $userCreatedId = DB::table('users')->insertGetId([
            "username" => $request->username,
            "email" => $request->email,
            "password" => bcrypt($request->password),
            "create_date" => $currentTime,
            "last_update" => $currentTime,
        ]);

        $authorCreated = DB::table('ms_author')->insert([
            "author_id" => $userCreatedId,
            "email" => $request->email,
            "username" => $request->username,
            "author_name" => $request->author_name,
            "pin" => $request->password,
            "gender" => $request->gender,
            "create_date" => $currentTime,
            "create_by" => null,
            "last_update" => $currentTime,
            "last_update_by" => null,
        ]);

        if ($userCreatedId && $authorCreated) {
            return response()->json([
                "status" => true,
                "message" => "Pendaftaran pengguna berhasil",
                "data" => []
            ]);
        } else {
            if ($userCreatedId) {
                DB::table('users')->where('id', $userCreatedId)->delete();
            }
            if ($authorCreated) {
                DB::table('ms_author')->where('author_id', $userCreatedId)->delete();
            }

            return response()->json([
                "status" => false,
                "message" => "Gagal mendaftarkan pengguna",
                "data" => []
            ], 500);
        }
    }

    public function login(Request $request)
    {
        $request->validate([
            "email" => "required|string",
            "password" => "required",
        ]);

        $credentials = $request->only('email', 'password');

        if (!$token = JWTAuth::attempt($credentials)) {
            return response()->json([
                "status" => false,
                "message" => "Mohon periksa kembali email & password anda!",
            ], 401);
        }

        $tokenData = JWTAuth::setToken($token)->getPayload();
        $authorId = $tokenData->get('sub');

        $existingToken = DB::table('ms_author_token')
            ->where('author_id', $authorId)
            ->first();

        if ($existingToken) {
            $expires_in = JWTAuth::factory()->getTTL() * 60;
            $expired_time = Carbon::now()->addSeconds($expires_in);

            DB::table('ms_author_token')
                ->where('author_id', $authorId)
                ->update([
                    'token' => $token,
                    'request_time' => Carbon::now(),
                    'expired_time' => $expired_time,
                ]);
        } else {
            $expires_in = JWTAuth::factory()->getTTL() * 60;
            $expired_time = Carbon::now()->addSeconds($expires_in);

            DB::table('ms_author_token')->insert([
                'author_id' => $authorId,
                'token' => $token,
                'request_time' => Carbon::now(),
                'expired_time' => $expired_time,
            ]);
        }

        return response()->json([
            "status" => true,
            "message" => "Pengguna berhasil masuk",
            "token" => $token,
            "expires_in" => $expires_in,
        ]);
    }

    public function me()
    {
        $userData = request()->user();

        $authorData = DB::table('ms_author')
                        ->where('author_id', $userData->id)
                        ->first();

        return response()->json([
            "status" => true,
            "message" => "Data profil",
            "user" => $userData,
            "author" => $authorData,
        ]);
    }

    public function logout()
    {
        $user = auth()->user();

        DB::table('ms_author_token')
            ->where('author_id', $user->id)
            ->delete();

        return response()->json([
            "status" => true,
            "message" => "Pengguna berhasil keluar",
        ]);
    }
}
