<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\FromArray;
class ArtistExport implements FromArray
{
    protected $invoices;

    public function __construct(array $data)
    {
        $this->data = $data;
    }

    public function array(): array
    {
        return $this->data;
    }
}
