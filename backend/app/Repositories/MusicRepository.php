<?php

namespace App\Repositories;
use App\Repositories\MusicRepositoryInterface;
use DB;
use App\Traits\PaginationTrait;
use Carbon\Carbon;


class MusicRepository implements MusicRepositoryInterface
{
    use PaginationTrait;

    public function getUserPagination($request)
    {
        return $this->paginate($request,'music',['title','album_name','genre']);
    }

    public function create(array $data)
    {
        $title = $data['title'];
        $album_name = $data['album_name'];
        $genre = $data['genre'];
        $artist_id = $data['artistid'];
        $created_at = Carbon::now();
        DB::insert(
            "INSERT INTO music (title,album_name,genre,artist_id,created_at) VALUES (?, ?, ?, ?,?)",
                [$title,$album_name,$genre,$artist_id,$created_at]
        );
    }

    public function update(array $data, $id)
    {
        $title = $data['title'];
        $album_name = $data['album_name'];
        $genre = $data['genre'];
        $music_id = $id;
        $update_at = Carbon::now();
        DB::update(
            "Update music set title = ?,album_name = ?,genre = ?,updated_at=? where id = ?",
                [$title,$album_name,$genre,$update_at,$music_id]
        );
    }

    public function delete($id)
    {
        $user_id = $id;
        $deleted_at = Carbon::now();
        DB::update(
            "Update music set deleted_at=? where id = ?",
                [$deleted_at,$user_id]
        );
    }

}