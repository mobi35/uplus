<?php

namespace App\Filament\Resources;

use App\Filament\Resources\BuildingResource\Pages;
use App\Filament\Resources\BuildingResource\RelationManagers;
use App\Filament\Resources\BuildingResource\Widgets\BuildingDetailsWidget;
use App\Models\Building;
use App\Models\FilamentUser;
use Filament\Facades\Filament;
use Filament\Forms;
use Filament\Forms\Components\MultiSelect;
use Filament\Resources\Form;
use Filament\Resources\Resource;
use Filament\Resources\Table;
use Filament\Tables;
use Filament\Tables\Filters\MultiSelectFilter;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Illuminate\Support\Facades\Auth;

class BuildingResource extends Resource
{
    protected static ?string $model = Building::class;

    protected static ?string $navigationIcon = 'heroicon-o-collection';
    public static function form(Form $form): Form
    {
		$arr = FilamentUser::all();
		$keys = collect($arr)->map(function ($item) {
			return $item['id'];
		});
		$monggo = collect($arr)->map(function ($item, $index)  {
			return $item['first_name']. ' '. $item['last_name'] ;
		});

        return $form
            ->schema([
                Forms\Components\TextInput::make('name')
                    ->required(),
                Forms\Components\Select::make('type')
				->options([
					'condo' => 'Condo',
					'commercial' => 'Commercial',
					'apartment' => 'Apartment',
					'office' => 'Office',
					'house' => 'House',
					'villa' => 'Villa'
				])
				->required(),

                Forms\Components\TextInput::make('room')
                    ->required()
                    ->maxLength(255),
                Forms\Components\TextInput::make('floor')
                    ->required(),
				Forms\Components\BelongsToSelect::make('owner_id')
					->relationship('owner', 'name')
					->required(),
                Forms\Components\TextInput::make('price')
                    ->required(),
                Forms\Components\TextInput::make('rent_price')
                    ->required(),
                Forms\Components\TextInput::make('address')
                    ->required()
                    ->maxLength(255),
                Forms\Components\TextInput::make('street')
                    ->required()
                    ->maxLength(255),
                Forms\Components\TextInput::make('barangay')
                    ->required()
                    ->maxLength(255),
                Forms\Components\TextInput::make('city')
                    ->required()
                    ->maxLength(255),
				Forms\Components\SpatieMediaLibraryFileUpload::make('images')->multiple(),
				MultiSelect::make('moderators')
				->relationship('moderators', 'first_name')
				->options(array_combine($keys->toArray(),$monggo->toArray()))

						]);
				}

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('name'),
                Tables\Columns\TextColumn::make('room'),
                Tables\Columns\TextColumn::make('floor'),
                Tables\Columns\TextColumn::make('owner.name'),
                Tables\Columns\TextColumn::make('price')->money('php'),
                Tables\Columns\TextColumn::make('rent_price')->money('php'),
                Tables\Columns\TextColumn::make('type'),
            ])
            ->filters([
				MultiSelectFilter::make('owner_id')->relationship('owner', 'name')
            ])
            ->actions([
                Tables\Actions\ViewAction::make(),
                Tables\Actions\EditAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\DeleteBulkAction::make(),
            ]);
    }
    
    public static function getRelations(): array
    {
        return [
            //
        ];
    }
    
    public static function getPages(): array
    {
        return [
            'index' => Pages\ListBuildings::route('/'),
            'create' => Pages\CreateBuilding::route('/create'),
            'view' => Pages\ViewBuilding::route('/{record}'),
            'edit' => Pages\EditBuilding::route('/{record}/edit'),
        ];
    }    


	public static function getEloquentQuery (): Builder 
	{
		if (Filament::auth()->user()->roles->toArray()[0]['name'] === 'super-admin')
			return Building::query();


		return Building::with(['moderators'])->whereHas('moderators', function ($q) {
			$q->where('filament_users.id', Filament::auth()->user()->id);
		});
	}

    public static function getWidgets(): array
	{
    return [
        BuildingDetailsWidget::class
    ];
	}
}
