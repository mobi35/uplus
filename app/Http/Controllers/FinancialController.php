<?php

namespace App\Http\Controllers;

use App\Models\Financial;
use Illuminate\Http\Request;

class FinancialController extends Controller
{

	public function get($id)
	{

		$financial = Financial::find($id);

		return view('financial-show', [
			'financial' => $financial
		]);
	}
}
