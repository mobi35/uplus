<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LeaseContract extends Model
{
    use HasFactory;

    public $guarded = ['id'];

    public function owner() {
        return $this->belongsTo(Owner::class);
    }

    public function signatory() {
        return $this->belongsTo(Signatory::class);
    }

    public function building() {
        return $this->belongsTo(Building::class);
    }
}
