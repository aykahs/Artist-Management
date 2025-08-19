<?php

namespace App\Repositories;
use App\Repositories\ArtistRepositoryInterface;
use DB;
use App\Traits\PaginationTrait;
use Carbon\Carbon;
use Excel;
use App\Exports\ArtistExport;
use Auth;


class ArtistRepository implements ArtistRepositoryInterface
{
    use PaginationTrait;

    public function getUserPagination($request)
    {
        return $this->paginate($request,'artists',['name','first_release_year'],[]);
    }

    public function create(array $data)
    {
        $name = $data['name'];
        $first_release_year = $data['first_release_year'];
        $no_of_album_release = $data['no_of_album_release'];
        $dob =  Carbon::parse($data['dob'])->toDateTimeString();
        $gender = $data['gender'];
        $address = $data['address'];
        $created_at = Carbon::now();
        $created_by =Auth::user()->id;
        DB::insert(
            "INSERT INTO artists (name,first_release_year,no_of_album_release,dob,gender,address,created_at,created_by) VALUES (?, ?, ?, ?,?,?,?,?)",
                [$name,$first_release_year,$no_of_album_release,$dob,$gender,$address,$created_at,$created_by]
        );
    }

    public function update(array $data, $id)
    {
        $name = $data['name'];
        $first_release_year = $data['first_release_year'];
        $no_of_album_release = $data['no_of_album_release'];
        $dob = Carbon::parse($data['dob'])->toDateTimeString();
        $gender = $data['gender'];
        $address = $data['address'];
        $artist_id =$id;
        $update_at = Carbon::now();
        $updated_by =Auth::user()->id;
        DB::update(
            "Update artists set name = ?,first_release_year = ?,no_of_album_release = ?,dob = ?,gender = ?,address = ?,updated_at=?,updated_by=? where id = ?",
                [$name,$first_release_year,$no_of_album_release,$dob,$gender,$address,$update_at,$updated_by,$artist_id]
        );
    }

    public function delete($id)
    {
        $user_id =$id;
        $deleted_at = Carbon::now();
        DB::update(
            "Update artists set deleted_at=? where id = ?",
                [$deleted_at,$user_id]
        );
    }
 
    public function excel()
    {
        $artist_data = DB::select('select name,first_release_year,	no_of_album_release,	dob,	gender,	address from artists where deleted_at is null');
        $artist_data = collect($artist_data)->toArray();
        $artist_array[] = array('Artist Name', 'First release year', 'No of album release', 'Address', 'Date of birth', 'Gender');
        foreach ($artist_data as $artist) {
            $artist_array[] = array(
                'Artist Name'  => $artist->name,
                'First release year'    => $artist->first_release_year,
                'No of album release'    => $artist->no_of_album_release,
                'Address'   => $artist->address,
                'Date of birth'   => $artist->dob,
                'Gender'   => $artist->gender
            );
        }
        $export = new ArtistExport($artist_array);
        return Excel::download($export, 'invoices.xlsx');
    }
    public function dashboard(){
       return  DB::select("select sum(a.ucount)ucount,sum(a.acount)acount,sum(a.mcount)mcount from(
                select count(id) as ucount,0 as acount,0 as mcount from users where deleted_at is null
                union all
                select 0  as ucount,count(id) as acount,0 as mcount from artists where deleted_at is null  
                union all
                select 0  as ucount,0 as acount,count(id) as mcount from music where deleted_at is null) as a ");
    }


}