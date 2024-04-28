<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>Laravel</title>

        @livewireStyles

        <link rel="stylesheet" href="{{ mix('css/app.css') }}">
        <script src="{{ mix('js/app.js') }}"></script>
    </head>
    <body class="font-sans antialiased">
        <div class="container mx-auto">
            <div class="login-form-container">
                <livewire:login-form />
            </div>
        </div>
        @livewireScripts
    </body>
</html>
