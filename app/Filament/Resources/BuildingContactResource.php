<?php

namespace App\Filament\Resources;

use App\Filament\Resources\BuildingContactResource\Pages;
use App\Filament\Resources\BuildingContactResource\RelationManagers;
use App\Models\BuildingContact;
use Filament\Forms;
use Filament\Resources\Form;
use Filament\Resources\Resource;
use Filament\Resources\Table;
use Filament\Tables;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class BuildingContactResource extends Resource
{
    protected static ?string $model = BuildingContact::class;

    protected static ?string $navigationIcon = 'heroicon-o-collection';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('name')
                    ->required()
                    ->maxLength(255),
                Forms\Components\TextInput::make('phone')
                    ->tel()
                    ->required()
                    ->maxLength(255),
				Forms\Components\BelongsToSelect::make('building_id')
				->relationship('building', 'unit_number')
				->required()
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('name'),
                Tables\Columns\TextColumn::make('phone'),
                Tables\Columns\TextColumn::make('building.name'),
                Tables\Columns\TextColumn::make('building.room')->label('Unit'),
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
            'index' => Pages\ListBuildingContacts::route('/'),
            'create' => Pages\CreateBuildingContact::route('/create'),
            'view' => Pages\ViewBuildingContact::route('/{record}'),
            'edit' => Pages\EditBuildingContact::route('/{record}/edit'),
        ];
    }    
}
