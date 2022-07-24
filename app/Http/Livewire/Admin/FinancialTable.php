<?php

namespace App\Http\Livewire\Admin;

use App\Domains\Auth\Models\User;
use App\Models\Financial;
use Illuminate\Database\Eloquent\Builder;
use Rappasoft\LaravelLivewireTables\DataTableComponent;
use Rappasoft\LaravelLivewireTables\Views\Column;
use Rappasoft\LaravelLivewireTables\Views\Filters\DateFilter;
use Rappasoft\LaravelLivewireTables\Views\Columns\ImageColumn;
use Rappasoft\LaravelLivewireTables\Views\Columns\LinkColumn;

class FinancialTable extends DataTableComponent
{

    protected $model = Financial::class;

	public function configure(): void {
		$this->setPrimaryKey('id');
	}

    public function columns(): array
    {
        return [
		   LinkColumn::make('Show')
					->title(fn($row) => 'Check')
					->location(fn($row) => '/financial/'.$row->id)
					->attributes(function($row) {
						return [
							'target' => '_self',
							'class' => 'underline text-blue-500',
						];
					}),
			Column::make('id'),
			  // ImageColumn::make('image')
     //            ->location(function($row) {
     //                return Financial::find($row->id)->getFirstMediaUrl();
     //            })
     //            ->attributes(function($row) {
     //                return [
     //                    'class' => 'w-40 w-40  rounded-full',
     //                ];
     //            }),
			Column::make('building_id', 'building.unit_number')
                ->searchable(),
            Column::make('description')
                ->sortable()
                ->searchable(),
            Column::make('payment_type')
                ->searchable(),
	         Column::make('total')
				->format(
					fn($value, $row, Column $column) => '₱ ' .number_format($value, 2)
				)
                ->sortable()
                ->searchable()
				->footer(function ($rows) {
		return 'Total: ₱ ' .number_format($rows->where('payment_type', 'revenue')->sum('total')  - $rows->where('payment_type', 'expenses')->sum('total')  , 2);
		}),

		
		   Column::make('created_at')
				->format(
					fn($value, $row, Column $column) => \Illuminate\Support\Carbon::createFromFormat('Y-m-d H:i:s', $value)->format('M-d-Y g:i A') 	)
				->sortable()
                ->searchable(),
		];
    }


	public function filters(): array
	{
		return [

			DateFilter::make('Created At')
			->config([
				'min' => '2020-01-01',
				'max' => '2024-12-31'
			])
		];

	}
}
