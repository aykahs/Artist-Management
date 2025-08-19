<?php

namespace App\Repositories;

interface ArtistRepositoryInterface
{
    public function  getUserPagination($request);

    public function create(array $data);

    public function update(array $data, $id);

    public function delete($id);
    public function excel();
    public function dashboard();
}