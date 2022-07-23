<?php

namespace App\Filament\Resources;

use App\Filament\Resources\FinancialResource\Pages;
use App\Filament\Resources\FinancialResource\RelationManagers;
use App\Models\Financial;
use Filament\Forms;
use Filament\Resources\Form;
use Filament\Resources\Resource;
use Filament\Resources\Table;
use Filament\Tables;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

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
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('payment_type'),
                Tables\Columns\TextColumn::make('building.unit_number'),
                Tables\Columns\TextColumn::make('description'),
                Tables\Columns\TextColumn::make('type'),
                Tables\Columns\TextColumn::make('total'),
                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime(),
               
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
            'index' => Pages\ListFinancials::route('/'),
            'create' => Pages\CreateFinancial::route('/create'),
            'view' => Pages\ViewFinancial::route('/{record}'),
            'edit' => Pages\EditFinancial::route('/{record}/edit'),
        ];
    }    
}
