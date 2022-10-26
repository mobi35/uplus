<?php

namespace App\Console\Commands;

use App\User;
use Illuminate\Console\Command;
use Rap2hpoutre\FastExcel\FastExcel;


class ExcelImport extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'excel:import';

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

        $collection = (new FastExcel)->import('storage/uplus.xlsx');
        
        dd($collection);
        return Command::SUCCESS;
    }
}
