<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\Models\Financial;
use DB;
class ShowFinances extends Component
{
    public function render()
    {
		$expenses = DB::table('financials')->selectRaw('sum(total) as total, payment_type')
		->groupBy('payment_type')
		->get();

		return view('livewire.show-finances', [
			'expenses' => $expenses,
			'currentMoney' => ( $expenses[0]->total ?? 0 ) - ( $expenses[1]->total ?? 0 ) 
		]);
    }
}
