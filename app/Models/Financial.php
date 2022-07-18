<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;

class Financial extends Model implements HasMedia
{
    use HasFactory;
    use InteractsWithMedia;

    protected $guarded = [
        'id',
    ];

  public function attachLogo($path, $fileName = ''): self
    {
        if ($fileName === '') {
            $extension = Str::afterLast($path, '.');
            $fileName = strtolower(str_replace(['#', '/', '\\', ' '], '-', $this->name)).'_'.$this->id.'.'.$extension;
        }

        $this->addMedia($path)
            ->usingFileName($fileName)
            ->usingName($this->name.'_'.$this->id)
            ->toMediaCollection('receipts');

        return $this;
    }
}
