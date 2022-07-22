<?php

namespace App\Filament\Resources\BuildingContactResource\Pages;

use App\Filament\Resources\BuildingContactResource;
use Filament\Pages\Actions;
use Filament\Resources\Pages\ViewRecord;

class ViewBuildingContact extends ViewRecord
{
    protected static string $resource = BuildingContactResource::class;

    protected function getActions(): array
    {
        return [
            Actions\EditAction::make(),
        ];
    }
}
