<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class FilamentUser extends Model
{

	public function buildings()
	{
		return $this->belongsToMany(Building::class);
	}

}
