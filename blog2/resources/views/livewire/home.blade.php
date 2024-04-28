@extends('components.layouts.app')

@section('content')
    <div class="absolute top-0 left-0 bottom-0 z-10">
        <div class="w-64 drop-shadow-4xl bg-biru min-h-screen fixed font-jakartasans">
            <div class="flex flex-col pl-10 pt-9">
                <div class="flex items-center gap-2">
                    <h1 class=" pl-[3px] font-bold tracking-wider">EBLOG <span class=" text-utama">BS</span></h1>
                </div>
                <div class="flex flex-col pt-14">
                    <h1 class=" pl-[3px] font-bold">Main Menu</h1>
                    <div class="flex flex-col pt-14">
                        <a href="" class="gap-3 mb-6 rounded-l-xl hover:border-r hover:border-r-utama group hover:bg-kelima py-2 flex items-center">
                            <h1 class=" group-hover:text-utama text-xs font-bold text-ketiga tracking-[0.02em]">Dashboard</h1>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
