<?php

namespace App\Filament\Resources;

use App\Filament\Resources\LeaseContractResource\Pages;
use App\Filament\Resources\LeaseContractResource\RelationManagers;
use App\Models\LeaseContract;
use Filament\Forms;
use Filament\Resources\Form;
use Filament\Resources\Resource;
use Filament\Resources\Table;
use Filament\Tables;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class LeaseContractResource extends Resource
{
    protected static ?string $model = LeaseContract::class;

    protected static ?string $navigationIcon = 'heroicon-o-collection';

    public static function form(Form $form): Form
    {
            return $form
            ->schema([
            Forms\Components\Select::make('owner_id')
					->relationship('owner', 'name')
                    ->searchable()
					->required(),
            Forms\Components\Select::make('signatory_id')
					->relationship('signatory', 'name')
                    ->searchable()
					->required(),
            Forms\Components\Select::make('building_id')
					->relationship('building', 'unit_number')
                    ->searchable()
					->required(),
            Forms\Components\DatePicker::make('contract_start')
					->required(),
            Forms\Components\TextInput::make('monthly_rent')->mask(fn (Forms\Components\TextInput\Mask $mask) => $mask->money('P ', ',', 2)),
            Forms\Components\Select::make('duration')
            ->options([
                '1' => '1 month',
                '6' => '6 months',
                '12' => '12 months',
                '24' => '24 months'
            ])
					->required(),
            Forms\Components\TextInput::make('number_of_advance')
					->required(),
            Forms\Components\TextInput::make('number_of_deposit')
					->required(),

            Forms\Components\RichEditor::make('body'),
            Forms\Components\Select::make('mode_of_payment')
            ->options([
                'cash' => 'cash',
                'pdc' => 'pdc'
            ])
            ->required(),

            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('contract_start')->date()->label('Start'),
                Tables\Columns\TextColumn::make('building.unit_number')->label('Unit #'),
                Tables\Columns\TextColumn::make('duration')->label('Duration'),
                Tables\Columns\TextColumn::make('monthly_rent')->money('php', 2)->label('Rent')
            ])
            ->filters([

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
            'index' => Pages\ListLeaseContracts::route('/'),
            'create' => Pages\CreateLeaseContract::route('/create'),
            'view' => Pages\ViewLeaseContract::route('/{record}'),
            'edit' => Pages\EditLeaseContract::route('/{record}/edit'),
        ];
    }    
}
