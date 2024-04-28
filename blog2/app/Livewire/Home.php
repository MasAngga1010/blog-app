<?php

namespace App\Livewire;

use Livewire\Component;

class Home extends Component
{
    public $welcomeMessage = "Welcome to the Home Page!";

    public function render()
    {
        // Gunakan layout 'mainD' untuk merender komponen
        return view('livewire.home');
    }
}
