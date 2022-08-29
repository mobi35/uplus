<?php

namespace App\Filament\Resources\LeaseContractResource\Pages;

use App\Filament\Resources\LeaseContractResource;
use Filament\Pages\Actions;
use Filament\Resources\Pages\EditRecord;

class EditLeaseContract extends EditRecord
{
    protected static string $resource = LeaseContractResource::class;

    protected function getActions(): array
    {
        return [
            Actions\ViewAction::make(),
            Actions\DeleteAction::make(),
        ];
    }
}
