<x-filament::widget>
    <x-filament::card>
		   {{ $widgetData["custom_content"] }}
          <br>
          Total Cost :  P {{ number_format($totalCost) }}
    </x-filament::card>
</x-filament::widget>
