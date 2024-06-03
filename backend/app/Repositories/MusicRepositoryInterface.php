<?php

namespace App\Repositories;

interface MusicRepositoryInterface
{
    public function  getUserPagination($request,$artist_id);

    public function create(array $data);

    public function update(array $data, $id);

    public function delete($id,$artist_id);
}