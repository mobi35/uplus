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

	\App\Models\User::factory()->create([
            'name' => 'jay',
            'email' => 'jay@china.com',
            'password' => bcrypt('china'),
        ]);
	
	\App\Models\User::factory()->create([
            'name' => 'mae',
            'email' => 'mae@ph.com',
            'password' => bcrypt('mae'),
        ]);

    


	\App\Models\Owner::factory()->create([
			'name' => 'Xin Wang',
			'address' => 'Numancia St. Manila',
			'nationality' => 'Chinese'
	]);

	\App\Models\Owner::factory()->create([
			'name' => 'Jinhai Wang',
			'address' => '1110 Parc Royale Condo',
			'nationality' => 'Chinese'
	]);



	}

}
