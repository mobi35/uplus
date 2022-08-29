<?php

namespace App\Filament\Resources\LeaseContractResource\Pages;

use App\Filament\Resources\LeaseContractResource;
use Filament\Pages\Actions;
use Filament\Resources\Pages\ViewRecord;

class ViewLeaseContract extends ViewRecord
{
    protected static string $resource = LeaseContractResource::class;

    protected function getActions(): array
    {
        return [
            Actions\EditAction::make(),
        ];
    }
}
