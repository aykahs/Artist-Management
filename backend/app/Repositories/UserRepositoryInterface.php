<?php

namespace App\Repositories;

interface UserRepositoryInterface
{
    public function  getUserPagination($request);

    public function create(array $data);
    public function register(array $data);

    public function update(array $data, $id);

    public function delete($id);
}