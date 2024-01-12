<?php

namespace App\Exports;

// use Maatwebsite\Excel\Concerns\FromCollection;
use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\WithCustomValueBinder;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Session;
class DataBidanExport extends \PhpOffice\PhpSpreadsheet\Cell\StringValueBinder  implements FromView,WithCustomValueBinder,ShouldAutoSize
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function view(): View
    {
        $data = Session::get('dataBidan');
        return view('dashboard.bidan.excel', [
            'data' => $data
        ]);
    }
}
