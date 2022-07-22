<?php

namespace App\Filament\Resources\BuildingContactResource\Pages;

use App\Filament\Resources\BuildingContactResource;
use Filament\Pages\Actions;
use Filament\Resources\Pages\EditRecord;

class EditBuildingContact extends EditRecord
{
    protected static string $resource = BuildingContactResource::class;

    protected function getActions(): array
    {
        return [
            Actions\ViewAction::make(),
            Actions\DeleteAction::make(),
        ];
    }
}
