<?php

namespace App\Filament\Resources\BuildingContactResource\Pages;

use App\Filament\Resources\BuildingContactResource;
use Filament\Pages\Actions;
use Filament\Resources\Pages\ListRecords;

class ListBuildingContacts extends ListRecords
{
    protected static string $resource = BuildingContactResource::class;

    protected function getActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
