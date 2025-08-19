<?php

namespace App\Providers;

use App\Repositories\ArtistRepository;
use App\Repositories\ArtistRepositoryInterface;
use App\Repositories\MusicRepository;
use App\Repositories\MusicRepositoryInterface;
use App\Repositories\UserRepository;
use App\Repositories\UserRepositoryInterface;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
        $this->app->bind(UserRepositoryInterface::class, UserRepository::class);
        $this->app->bind(MusicRepositoryInterface::class, MusicRepository::class);
        $this->app->bind(ArtistRepositoryInterface::class, ArtistRepository::class);

    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        //
    }
}
