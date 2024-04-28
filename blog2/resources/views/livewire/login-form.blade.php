<div>
    <!-- Form Login -->
    <form wire:submit.prevent="login" class="login-form">
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" wire:model="email" class="form-control" required autofocus>
            @error('email') <span class="text-danger">{{ $message }}</span> @enderror
        </div>

        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" id="password" wire:model="password" class="form-control" required>
            @error('password') <span class="text-danger">{{ $message }}</span> @enderror
        </div>

        <button type="submit" class="btn btn-primary">Login</button>

        @if ($errorMessage)
            <div class="alert alert-danger mt-2">
                {{ $errorMessage }}
            </div>
        @endif
    </form>
</div>
