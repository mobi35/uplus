<div>


		<h1 class="text-2xl "> Money I have is {{  '₱' .number_format($currentMoney, 2) }} </h1>

	<div class="my-4 flex  ">
	@foreach($expenses as $expense)
		<div class="mx-4 space-x-4 flex items-center">
		<h1 class="font-semibold text-gray-400 ">  {{ $expense->payment_type  }}</h1>
		<h1 class="text-2xl {{ $expense->payment_type == 'expenses' ? 'text-red-500' : 'text-green-500' }} "> {{  '₱' .number_format($expense->total, 2) }} </h1>
		</div>
	@endforeach

	</div>
	@livewire('financial.table')
</div>
