<?php

namespace App\Filament\Resources\SignatoryResource\Pages;

use App\Filament\Resources\SignatoryResource;
use Filament\Pages\Actions;
use Filament\Resources\Pages\EditRecord;

class EditSignatory extends EditRecord
{
    protected static string $resource = SignatoryResource::class;

    protected function getActions(): array
    {
        return [
            Actions\ViewAction::make(),
            Actions\DeleteAction::make(),
        ];
    }
}
