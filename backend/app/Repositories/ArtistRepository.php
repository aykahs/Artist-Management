<?php

namespace App\Repositories;
use App\Repositories\ArtistRepositoryInterface;
use DB;
use App\Traits\PaginationTrait;


class ArtistRepository implements ArtistRepositoryInterface
{
    use PaginationTrait;

    public function getUserPagination($request)
    {
        return $this->paginate($request,'users');
    }

    public function create(array $data)
    {
        $name = $data['name'];
        $first_release_year = $data['first_release_year'];
        $no_of_album_release = $data['no_of_album_release'];
        $dob = $data['dob'];
        $gender = $data['gender'];
        $address = $data['address'];
        $created_at = Carbon::now();
        DB::insert(
            "INSERT INTO artists (name,first_release_year,no_of_album_release,dob,gender,address,created_at) VALUES (?, ?, ?, ?,?,?,?,?,?,?)",
                [$name,$first_release_year,$no_of_album_release,$dob,$gender,$address,$created_at]
        );
    }

    public function update(array $data, $id)
    {
        $name = $data['name'];
        $first_release_year = $data['first_release_year'];
        $no_of_album_release = $data['no_of_album_release'];
        $dob = $data['dob'];
        $gender = $data['gender'];
        $address = $data['address'];
        $artist_id =$id;
        $update_at = Carbon::now();
        DB::update(
            "Update artists set name = ?,first_release_year = ?,no_of_album_release = ?,dob = ?,gender = ?,address = ?,updated_at=? where id = ?",
                [$name,$first_release_year,$no_of_album_release,$dob,$gender,$address,$update_at,$artist_id]
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

}