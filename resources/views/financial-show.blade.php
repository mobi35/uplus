<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('U+ REALTY') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
			<h1 class="py-4 font-semibold text-2xl"> {{ $financial-> description}} </h1>

			<label class="text-md text-gray-400"> Condo: </label>
			<h1> {{ $financial->building->unit_number}} </h1>

			<label class="text-md text-gray-400"> Payment Type: </label>
			<h1> {{ $financial->payment_type}} </h1>

			<label class="text-md text-gray-400"> Transaction Type: </label>
			<h1> {{ $financial->type}} </h1>

			<label class="text-md text-gray-400">Total Amount:</label>
			<h1 class="text-gray-600 font-semibold"> {{  '₱' .number_format($financial->total, 2) }} </h1>
			<br>

			<label class="text-xs text-gray-400">Created on: </label>
			<h1 > {{ $financial->created_at->diffForHumans()}} </h1>


			<br><br>
			<label class="text-md text-gray-400"> Additional Comments: </label>

			<span > {!! $financial->body !!} </span>
			<br><br>


		@foreach ($financial->getMedia() as $media)

		<img src="{{ $media->getUrl(); }}" />
			

		@endforeach
        </div>
    </div>
</x-app-layout>
