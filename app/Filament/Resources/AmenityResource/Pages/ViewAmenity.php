<?php

namespace App\Filament\Resources\AmenityResource\Pages;

use App\Filament\Resources\AmenityResource;
use Filament\Pages\Actions;
use Filament\Resources\Pages\ViewRecord;

class ViewAmenity extends ViewRecord
{
    protected static string $resource = AmenityResource::class;

    protected function getActions(): array
    {
        return [
            Actions\EditAction::make(),
        ];
    }
}
