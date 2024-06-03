<?php

namespace App\Repositories;
use App\Repositories\MusicRepositoryInterface;
use DB;
use App\Traits\PaginationTrait;
use Carbon\Carbon;
use Auth;

class MusicRepository implements MusicRepositoryInterface
{
    use PaginationTrait;

    public function getUserPagination($request,$artist_id)
    {
        return $this->paginate($request,'music',['title','album_name','genre'],['artist_id',$artist_id]);
    }

    public function create(array $data)
    {
        $title = $data['title'];
        $album_name = $data['album_name'];
        $genre = $data['genre'];
        $artist_id = $data['artistid'];
        $created_at = Carbon::now();
        $created_by =Auth::user()->id;
        DB::insert(
            "INSERT INTO music (title,album_name,genre,artist_id,created_at,created_by) VALUES (?, ?, ?, ?,?,?)",
                [$title,$album_name,$genre,$artist_id,$created_at,$created_by]
        );
        DB::update(
            "update artists set no_of_album_release = no_of_album_release+1 where id = ?",
                [$artist_id]
        );
    }

    public function update(array $data, $id)
    {
        $title = $data['title'];
        $album_name = $data['album_name'];
        $genre = $data['genre'];
        $music_id = $id;
        $update_at = Carbon::now();
        $updated_by =Auth::user()->id;
        DB::update(
            "Update music set title = ?,album_name = ?,genre = ?,updated_at=?,updated_by=? where id = ?",
                [$title,$album_name,$genre,$update_at,$updated_by,$music_id]
        );
    }

    public function delete($id,$artist_id)
    {
        $user_id = $id;
        $deleted_at = Carbon::now();
        DB::update(
            "Update music set deleted_at=? where id = ?",
                [$deleted_at,$user_id]
        );
        DB::update(
            "update artists set no_of_album_release = no_of_album_release-1 where id = ?",
                [$artist_id]
        );
    }

}