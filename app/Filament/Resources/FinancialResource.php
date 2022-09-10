<?php

namespace App\Filament\Resources;

use Filament\Forms;
use Filament\Tables;
use App\Models\Building;
use App\Models\Financial;
use Filament\Resources\Form;
use Filament\Resources\Table;
use Filament\Facades\Filament;
use Illuminate\Support\Carbon;
use Filament\Resources\Resource;
use Filament\Tables\Filters\Filter;
use Filament\Forms\Components\DatePicker;
use Filament\Tables\Filters\SelectFilter;
use Illuminate\Database\Eloquent\Builder;
use Filament\Forms\Components\DateTimePicker;
use Filament\Tables\Filters\MultiSelectFilter;
use App\Filament\Resources\FinancialResource\Pages;
use Illuminate\Database\Eloquent\SoftDeletingScope;

use pxlrbt\FilamentExcel\Actions\Tables\ExportBulkAction;
use App\Filament\Resources\FinancialResource\RelationManagers;
use App\Filament\Resources\FinancialResource\Widgets\StatOverview;
use App\Filament\Resources\FinancialResource\Widgets\FinancialOverview;
use App\Filament\Resources\FinancialResource\Widgets\FinancialWidgetTable;
use Ariaieboy\FilamentJalaliDatetimepicker\Forms\Components\JalaliDateTimePicker;

class FinancialResource extends Resource
{
    protected static ?string $model = Financial::class;

    protected static ?string $navigationIcon = 'heroicon-o-collection';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\BelongsToSelect::make('building_id')
					->relationship('building', 'unit_number')
					->required(),
                Forms\Components\TextInput::make('description')
                    ->required()
                    ->maxLength(255),
                DateTimePicker::make('date_transacted')
                    ->withoutSeconds()
                    ->required(),
				Forms\Components\RichEditor::make('body'),
                Forms\Components\Select::make('type')

				->options([
					'dues' => 'Dues',
					'bill' => 'Bill',
					'repair'=> 'Repair',
					'fare' => 'Fare',
					'bank' => 'Bank' 
				])->required(),
				Forms\Components\Select::make('payment_type')
				->options([
					'revenue' => 'Revenue',
					'expenses' => 'Expenses',
				])->required(),
                Forms\Components\TextInput::make('total')
				->mask(fn (Forms\Components\TextInput\Mask $mask) => $mask
				->money('P ')
				->numeric()
				->thousandsSeparator(',')
				->decimalPlaces(2)
				)->required(),
				Forms\Components\SpatieMediaLibraryFileUpload::make('receipts')->multiple()

            ]);
    }

    public static function table(Table $table): Table
    {

		$arr =  Building::with(['moderators'])->whereHas('moderators', function ($q) {
			$q->where('filament_users.id', Filament::auth()->user()->id);
		})->get();

		$id = collect($arr)->map(function ($item) {
			return $item['unit_number'];
		});
		$unit_number = collect($arr)->map(function ($item, $index)  {
			return $item['unit_number'];
		});
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('payment_type'),
                Tables\Columns\TextColumn::make('building.unit_number'),
                Tables\Columns\TextColumn::make('description'),
                Tables\Columns\TextColumn::make('type'),
                Tables\Columns\TextColumn::make('total'),
                Tables\Columns\TextColumn::make('date_transacted')
                    ->dateTime(),
               
            ])
            ->filters([
				MultiSelectFilter::make('status')
                ->form([
                    Forms\Components\MultiSelect::make('buildings')
					->options(
							 array_combine($id->toArray(),$unit_number->toArray()) 
						)->label('Buildings'),
                ])
                ->query(function (Builder $query, array $data): Builder {
					if( !count($data['buildings']) && Filament::auth()->user()->roles->toArray()[0]['name'] === 'super-admin' ) {
						return $query;
					}
					return $query->whereHas('building', function ($q) use($data) {
						$q->whereIn('unit_number', $data['buildings']);
					});
				}),

    Filter::make('date_transacted')
    ->form([
        DatePicker::make('from')->default('2022-01-01'),
        DatePicker::make('until')->default('2022-12-30'),
    ])
    // ...
    ->indicateUsing(function (array $data): array {
        $indicators = [];
 
        if ($data['from'] ?? null) {
            $indicators['from'] = 'Created from ' . Carbon::parse($data['from'])->toFormattedDateString();
        }
 
        if ($data['until'] ?? null) {
            $indicators['until'] = 'Created until ' . Carbon::parse($data['until'])->toFormattedDateString();
        }
 
        return $indicators;
    })->query(function (Builder $query, array $data): Builder {
					return $query
                    ->where('date_transacted', '>=', Carbon::parse($data['from']))
                    ->where('date_transacted', '<=', Carbon::parse($data['until']))
                    ;

        }),
                //
            ])
            ->actions([
                Tables\Actions\ViewAction::make(),
                Tables\Actions\EditAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\DeleteBulkAction::make(),
                ExportBulkAction::make()
            ]);
    }
    
    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public function getTableBulkActions()
    {
        return  [
            ExportBulkAction::make()
        ];
    }
    
    public static function getPages(): array
    {
        return [
            'index' => Pages\ListFinancials::route('/'),
            'create' => Pages\CreateFinancial::route('/create'),
            'view' => Pages\ViewFinancial::route('/{record}'),
            'edit' => Pages\EditFinancial::route('/{record}/edit'),
        ];
    }    

	protected function getTableQuery(): Builder
    {
		
		if (Filament::auth()->user()->roles->toArray()[0]['name'] === 'super-admin')
			return Financial::query();

		$ratbu = Building::with(['moderators'])->whereHas('moderators', function ($q) {
			$q->where('filament_users.id', Filament::auth()->user()->id);
		});

		$cool = collect($ratbu->get('id'))->pluck('id')->flatten()->toArray();

		return Financial::query()->orWhere(function ($query) use($cool) {
				for ($i = 0; $i < count($cool); $i++) {
					$query->orWhere('building_id', $cool[$i]);
				}
        })->orderBy('date_transacted');
    }

	

	public static function getWidgets(): array
	{
    return [
        StatOverview::class
    ];
	}

}
