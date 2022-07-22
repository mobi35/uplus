<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // \App\Models\User::factory(10)->create();

        \App\Models\User::factory()->create([
            'name' => 'adrian',
            'email' => 'mobistyle35@gmail.com',
            'password' => bcrypt('Asakaboi35'),
        ]);
    }
}
