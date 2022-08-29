<?php

namespace App\Filament\Resources\OwnerResource\Pages;

use App\Filament\Resources\OwnerResource;
use Filament\Pages\Actions;
use Filament\Resources\Pages\ViewRecord;

class ViewOwner extends ViewRecord
{
    protected static string $resource = OwnerResource::class;



	// protected static string $view = 'filament.owner.view';

    protected function getActions(): array
    {
        return [
            Actions\EditAction::make(),
        ];
    }

  protected function getFooterWidgets(): array
    {
        return [
			OwnerResource\Widgets\OwnerBuildings::class
        ];
    }





}
