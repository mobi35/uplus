<?php

namespace App\Filament\Resources\BuildingResource\Pages;

use App\Filament\Resources\BuildingResource;
use App\Filament\Resources\BuildingResource\Widgets\BuildingDetailsWidget;
use Filament\Pages\Actions;
use Filament\Resources\Pages\ViewRecord;

class ViewBuilding extends ViewRecord
{
    protected static string $resource = BuildingResource::class;


    public string $tarub = 'tarub ito ni adi';
    

    protected function getHeaderWidgets(): array
    {
        return [
        ];
    }

    protected function getActions(): array
    {
        return [
            Actions\EditAction::make(),
        ];
    }


}
