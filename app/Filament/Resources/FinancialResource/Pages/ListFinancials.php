<?php

namespace App\Filament\Resources\FinancialResource\Pages;

use Filament\Pages\Actions;
use Filament\Resources\Pages\ListRecords;
use App\Filament\Resources\FinancialResource;
use pxlrbt\FilamentExcel\Exports\ExcelExport;
use pxlrbt\FilamentExcel\Actions\Pages\ExportAction;
use App\Filament\Resources\FinancialResource\Widgets\StatOverview;
use App\Filament\Resources\FinancialResource\Widgets\FinancialOverview;
use App\Filament\Resources\FinancialResource\Widgets\FinancialWidgetTable;
use Illuminate\Database\Eloquent\Model;

class ListFinancials extends ListRecords
{
    protected static string $resource = FinancialResource::class;

    public ?Model $record = null;

    protected function getActions(): array
    {
        return [
            Actions\CreateAction::make(),
            ExportAction::make()
        ];
    }

	protected function getHeaderWidgets(): array
    {
        return [
            StatOverview::class,
        ];
    }

    private function updateData()
    {
        $this->emit('updateFromFilters', [
			'revenue' => $this->getFilteredTableQuery()->where('payment_type', 'revenue')->sum('total'),
			'expenses' => $this->getFilteredTableQuery()->where('payment_type', 'expenses')->sum('total')
        ]);
    }

    protected function updated()
	{
        $this->updateData();
	}

    public function dehydrate(): void
    {
        $this->updateData();
    }

    

    


}
