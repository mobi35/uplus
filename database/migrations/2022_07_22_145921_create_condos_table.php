<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('buildings', function (Blueprint $table) {
            $table->id();
			$table->string('name');
			$table->string('type');
			$table->string('room');
			$table->integer('floor');
			$table->foreignId('owner_id');
			$table->float('price');
			$table->float('rent_price');
			$table->string('address');
			$table->string('street');
			$table->string('barangay');
			$table->string('city');
			$table->string('unit_number')->virtualAs('concat(name, \' \', room)');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('condos');
    }
};
