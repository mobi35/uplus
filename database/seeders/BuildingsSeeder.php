<?php

namespace Database\Seeders;

use App\Models\Building;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class BuildingsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Building::factory()->create([
            'name' => 'BSA',
            'type' => 'condo',
            'floor' => 9,
            'owner_id' => 1,
            'price' => 10,
            'rent_price' => 10,
            'address' => 'BSA Twin Towers',
            'barangay'  => 'no',
            'street'  => 'no',
            'city' => 'Mandaluyong',
            'room' => '905B'
        ]);

        Building::factory()->create([
            'name' => 'PRC',
            'type' => 'condo',
            'floor' => 11,
            'owner_id' => 1,
            'price' => 10,
            'rent_price' => 10,
            'barangay'  => 'no',
            'address' => 'Parc Royale Condo',
            'street'  => 'no',
            'city' => 'Ortigas',
            'room' => '1110'
        ]);

        Building::factory()->create([
            'name' => 'PRC',
            'type' => 'condo',
            'floor' => 14,
            'owner_id' => 1,
            'price' => 10,
            'rent_price' => 10,
            'address' => 'Parc Royale Condo',
            'barangay'  => 'no',
            'street'  => 'no',
            'city' => 'Ortigas',
            'room' => '1409'
        ]);

        Building::factory()->create([
            'name' => 'Millenia',
            'type' => 'condo',
            'floor' => 32,
            'owner_id' => 1,
            'price' => 10,
            'rent_price' => 10,
            'barangay'  => 'no',
            'address' => 'Millenia Suites',
            'street'  => 'no',
            'city' => 'Ortigas',
            'room' => '32DE'
        ]);

        Building::factory()->create([
            'name' => 'BSA',
            'type' => 'condo',
            'floor' => 31,
            'owner_id' => 1,
            'barangay'  => 'no',
            'price' => 10,
            'rent_price' => 10,
            'address' => 'BSA',
            'street'  => 'no',
            'city' => 'Ortigas',
            'room' => '3102B'
        ]);

        Building::factory()->create([
            'name' => 'BSA',
            'type' => 'condo',
            'floor' => 31,
            'owner_id' => 1,
            'price' => 10,
            'rent_price' => 10,
            'address' => 'BSA',
            'street'  => 'no',
            'city' => 'Ortigas',
            'room' => '3108B',
            'barangay'  => 'no',
        ]);

        Building::factory()->create([
            'name' => 'BSA',
            'type' => 'condo',
            'floor' => 31,
            'owner_id' => 1,
            'price' => 10,
            'barangay'  => 'no',
            'rent_price' => 10,
            'address' => 'BSA',
            'street'  => 'no',
            'city' => 'Ortigas',
            'room' => '32LM'
        ]);

        Building::factory()->create([
            'name' => 'Millenia',
            'type' => 'condo',
            'floor' => 15,
            'owner_id' => 1,
            'price' => 10,
            'rent_price' => 10,
            'address' => 'Millenia',
            'street'  => 'no',
            'barangay'  => 'no',
            'city' => 'Ortigas',
            'room' => '15Q'
        ]);

    Building::factory()->create([
            'name' => 'BSA',
            'type' => 'condo',
            'floor' => 17,
            'owner_id' => 1,
            'price' => 10,
            'rent_price' => 10,
            'address' => 'BSA',
            'street'  => 'no',
            'city' => 'Ortigas',
            'barangay'  => 'no',
            'room' => '1701B'
        ]);

 Building::factory()->create([
            'name' => 'Sonata',
            'type' => 'condo',
            'floor' => 29,
            'owner_id' => 1,
            'price' => 10,
            'rent_price' => 10,
            'address' => 'Sonata',
            'barangay'  => 'no',
            'street'  => 'no',
            'city' => 'Ortigas',
            'room' => '29D'
        ]);

 Building::factory()->create([
            'name' => 'BSA',
            'type' => 'condo',
            'floor' => 15,
            'owner_id' => 1,
            'price' => 10,
            'rent_price' => 10,
            'address' => 'BSA',
            'street'  => 'no',
            'barangay'  => 'no',
            'city' => 'Ortigas',
            'room' => '1501A'

        ]);

 Building::factory()->create([
            'name' => 'BSA',
            'type' => 'condo',
            'floor' => 47,
            'owner_id' => 1,
            'price' => 10,
            'rent_price' => 10,
            'address' => 'BSA',
            'street'  => 'no',
            'barangay'  => 'no',
            'city' => 'Ortigas',
            'room' => '4713A'
        ]);

    }
}
