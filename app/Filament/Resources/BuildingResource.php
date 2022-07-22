<?php

namespace App\Filament\Resources;

use App\Filament\Resources\BuildingResource\Pages;
use App\Filament\Resources\BuildingResource\RelationManagers;
use App\Models\Building;
use Filament\Forms;
use Filament\Resources\Form;
use Filament\Resources\Resource;
use Filament\Resources\Table;
use Filament\Tables;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class BuildingResource extends Resource
{
    protected static ?string $model = Building::class;

    protected static ?string $navigationIcon = 'heroicon-o-collection';

    public static function form(Form $form): Form
    {
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
                Forms\Components\TextInput::make('owner')
                    ->required()
                    ->maxLength(255),
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
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('name'),
                Tables\Columns\TextColumn::make('room'),
                Tables\Columns\TextColumn::make('floor'),
                Tables\Columns\TextColumn::make('owner'),
                Tables\Columns\TextColumn::make('price')->money('php'),
                Tables\Columns\TextColumn::make('rent_price')->money('php'),
                Tables\Columns\TextColumn::make('type'),
            ])
            ->filters([
                //
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
}
