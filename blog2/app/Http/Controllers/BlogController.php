<?php

namespace App\Http\Controllers;

use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class BlogController extends Controller
{

    public function index()
    {
        $blogs = DB::select('SELECT image, title, content, author_id, status, published_date, create_date, last_update FROM blog_posts');

        return response()->json($blogs, 200);
    }

    public function store(Request $request)
    {
        $messages = [
            'title.min' => 'Panjang judul harus minimal 20 karakter.',
            'required' => 'Mohon cek semua kolom karna wajib di isi.',
            'exists' => 'Data yang dipilih pada kolom :attribute tidak valid.',
            'in' => 'Kolom :attribute harus salah satu dari nilai: :values.',
            'string' => 'Kolom :attribute harus berupa teks.',
        ];

        $validator = Validator::make($request->all(), [
            'image' => 'required|string',
            'title' => 'required|string|min:20',
            'content' => 'required|string',
            'author_id' => 'required|exists:users,id',
            'status' => 'required|in:draft,published',
        ], $messages);

        if ($validator->fails()) {
            return response()->json(['message' => $validator->errors()->first()], 400);
        }

        $imageUrl = $this->processImage($request->input('image'), $request->input('title'));

        $now = now();

        $result = DB::insert('INSERT INTO blog_posts (title, content, image, author_id, status, published_date, create_date, last_update)
                            VALUES (?, ?, ?, ?, ?, ?, ?, ?)', [
                                $request->title,
                                $request->content,
                                $imageUrl,
                                $request->author_id,
                                $request->status,
                                $now,
                                $now,
                                $now,
                            ]);

        if ($result) {
            return response()->json(['message' => 'Berhasil membuat blog'], 201);
        } else {
            return response()->json(['message' => 'Gagal membuat blog'], 500);
        }
    }

    public function processImage($base64Image, $title)
    {
        // Direktori penyimpanan gambar
        $imageFolder = public_path('images');

        // Membuat direktori jika belum ada
        if (!file_exists($imageFolder)) {
            mkdir($imageFolder, 0755, true);
        }

        // Mengambil data gambar dari base64 string
        $imageData = base64_decode(preg_replace('#^data:image/\w+;base64,#i', '', $base64Image));

        // Nama file gambar
        $imageName = '/' . Str::slug($title) . '_' . uniqid() . '.jpg';

        // Path lengkap file gambar
        $imagePath = $imageFolder . $imageName;

        // Menyimpan gambar ke file
        file_put_contents($imagePath, $imageData);

        // Mengembalikan URL gambar
        return url('/images' . $imageName);
    }

    // public function processImage($base64Image, $title)
    // {
    //     // Direktori penyimpanan gambar
    //     $imageFolder = public_path('images');

    //     // Membuat direktori jika belum ada
    //     if (!file_exists($imageFolder)) {
    //         mkdir($imageFolder, 0755, true);
    //     }

    //     // Mengambil data gambar dari base64 string
    //     $imageData = base64_decode(preg_replace('#^data:image/\w+;base64,#i', '', $base64Image));

    //     // Nama file gambar
    //     $imageName = '/' . Str::slug($title) . '_' . uniqid() . '.jpg';

    //     // Path lengkap file gambar
    //     $imagePath = $imageFolder . $imageName;

    //     // Menyimpan gambar ke file
    //     file_put_contents($imagePath, $imageData);

    //     // Mengembalikan URL gambar dengan domain localhost
    //     return 'http://localhost:8000' . '/images' . $imageName;
    // }

    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'title' => 'required|string',
            'content' => 'required|string',
            'author_id' => 'required|exists:users,id',
            'status' => 'required|in:draft,published',
            'published_date' => 'nullable|date',
        ]);

        if ($validator->fails()) {
            return response()->json(['message' => $validator->errors()->first()], 400);
        }

        $blog = DB::table('blog_posts')->where('id', $id)->first();

        if (!$blog) {
            return response()->json(['message' => 'Blog tidak ditemukan'], 404);
        }

        $imageUrl = $this->processImage($request->input('image'), $request->input('title'));

        $result = DB::table('blog_posts')
            ->where('id', $id)
            ->update([
                'title' => $request->title,
                'content' => $request->content,
                'image' => $imageUrl,
                'author_id' => $request->author_id,
                'status' => $request->status,
                'published_date' => $request->published_date,
                'last_update' => now(),
            ]);

        if ($result) {
            return response()->json(['message' => 'Blog berhasil diperbarui'], 200);
        } else {
            return response()->json(['message' => 'Gagal memperbarui blog'], 500);
        }
    }

    public function delete($id)
    {
        $blog = DB::table('blog_posts')->where('id', $id)->first();

        if (!$blog) {
            return response()->json(['message' => 'Blog tidak ditemukan'], 404);
        }

        $result = DB::table('blog_posts')->where('id', $id)->delete();

        if ($result) {
            return response()->json(['message' => 'Blog berhasil dihapus'], 200);
        } else {
            return response()->json(['message' => 'Gagal menghapus blog'], 500);
        }
    }
}
