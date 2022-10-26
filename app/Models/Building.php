<?php

namespace App\Models;

use Spatie\MediaLibrary\HasMedia;
use Illuminate\Database\Eloquent\Model;
use Spatie\MediaLibrary\InteractsWithMedia;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Chiiya\FilamentAccessControl\Models\FilamentUser;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Building extends Model implements HasMedia
{
	use InteractsWithMedia;
    use HasFactory;

	protected $guarded = ['id'];

	protected $casts = [
		'images' => 'array'
	];


	public function buildingContacts() 
	{
		return $this->hasMany(BuildingContact::class);
	}

	public function owner()
	{
		return $this->belongsTo(Owner::class);
	}

	public function moderators()
	{
		return $this->belongsToMany(FilamentUser::class);
	}


}
