<?php

return [
    // Paths yang diizinkan untuk permintaan lintas asal
    'paths' => ['api/*', 'sanctum/csrf-cookie'],

    // Metode HTTP yang diizinkan
    'allowed_methods' => ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'],

    // Domain asal yang diizinkan
    'allowed_origins' => ['http://localhost:5173'], // Ganti dengan asal yang tepat

    // Header yang diizinkan
    'allowed_headers' => ['*'], // Atau tentukan header spesifik

    // Header yang diekspos ke frontend
    'exposed_headers' => [],

    // Waktu penyimpanan cache permintaan preflight
    'max_age' => 0,

    // Mengizinkan permintaan dengan kredensial
    'supports_credentials' => true,
];
