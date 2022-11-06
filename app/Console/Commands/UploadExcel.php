<?php

namespace App\Console\Commands;

use App\Models\Building;
use App\Models\Financial;
use Carbon\Carbon;
use DateTime;
use Exception;
use Illuminate\Console\Command;
use Rap2hpoutre\FastExcel\FastExcel;

class UploadExcel extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'upload:excel';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {

        $users = (new FastExcel)->import(storage_path(). '/uplus.xlsx', function ($line) {
           

            try { 
            $building = Building::where('room', $line['unit'])->firstOrFail();
            } catch (Exception $e) {
                dd($e, $line['unit']);
            }

            Financial::create([
                'building_id' => $building->id,
                'description' => $line['details'],
                'type' => 'bank',
                'total' => $line['amount'],
                'payment_type' => $line['type'],
                'body' => '',
                'date_transacted' =>Carbon::now() 
            ]);

        // return User::create([
        // 'name' => $line['Name'],
        // 'email' => $line['Email']
        // ]);

        });
        return Command::SUCCESS;
    }
}
