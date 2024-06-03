<?php

namespace App\Imports;

use App\Models\Artist;
use Maatwebsite\Excel\Concerns\ToModel;
use Carbon\Carbon;
use Log;
use Auth;
class ArtistImport implements ToModel
{
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row)
    {
        if (!isset($row[0])) {
            return null;
        }
        return new Artist([
            'name' => $row[0],
            'first_release_year' => $row[1],
            'no_of_album_release' => $row[2],
            'dob' => $row[3],
            'gender' => $row[4],
            'address' => $row[5],
            'created_at' => Carbon::now(),
            'created_by' => Auth::user()->id
        ]);
        
    }
}
