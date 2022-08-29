<?php
namespace App\Filament\Resources\FinancialResource\Widgets;

use App\Models\Building;
use App\Models\Financial;
use Filament\Facades\Filament;
use Filament\Tables\Columns\TextColumn;
use Illuminate\Database\Eloquent\Builder;
use Filament\Widgets\StatsOverviewWidget\Card;

use Filament\Widgets\StatsOverviewWidget as BaseWidget;

class StatOverview extends BaseWidget
{

	public $revenue = 0;
	public $expenses = 0;


	protected $listeners = ['updateFromFilters' => 'getFinancials'];

    public function getFinancials($data)
	{
        $this->revenue = $data['revenue'];
        $this->expenses = $data['expenses'];
	}

	protected function getCards() : array
	{
		return [
			Card::make('revenue','P ' . number_format($this->revenue) ),
			Card::make('expenses','P ' . number_format($this->expenses) ),
			Card::make('Current Money','P ' . number_format($this->revenue - $this->expenses ) )
		];
	}
}
