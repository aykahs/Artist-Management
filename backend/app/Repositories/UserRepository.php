<?php

namespace App\Repositories;
use App\Repositories\UserRepositoryInterface;
use DB;
use App\Traits\PaginationTrait;
use Carbon\Carbon;

class UserRepository implements UserRepositoryInterface
{
    use PaginationTrait;

    public function getUserPagination($request)
    {
        return $this->paginate($request,'users',['first_name','last_name','phone']);
    }

    public function create(array $data)
    {
        $first_name = $data['first_name'];
        $last_name = $data['last_name'];
        $phone = $data['phone'];
        $dob = $data['dob'];
        $gender = $data['gender'];
        $address = $data['address'];
        $email = $data['email'];
        $password = $data['password'];
        $username = $data['username'];
        $created_at = Carbon::now();
        DB::insert(
            "INSERT INTO users (first_name,last_name,phone,dob,gender,address,email,password,username,created_at) VALUES (?, ?, ?, ?,?,?,?,?,?,?)",
                [$first_name,$last_name,$phone,$dob,$gender,$address,$email,$password,$username,$created_at]
        );
    }

    public function update(array $data, $id)
    {
        $first_name = $data['first_name'];
        $last_name = $data['last_name'];
        $phone = $data['phone'];
        $dob = $data['dob'];
        $gender = $data['gender'];
        $address = $data['address'];
        $email = $data['email'];
        $username = $data['username'];
        $user_id = $id;
        $update_at = Carbon::now();
        DB::update(
            "Update users set first_name = ?,last_name = ?,phone = ?,dob = ?,gender = ?,address = ?,email = ?,username = ?,updated_at=? where id = ?",
                [$first_name,$last_name,$phone,$dob,$gender,$address,$email,$username,$update_at,$user_id]
        );
    }

    public function delete($id)
    {
        $user_id = $id;
        $deleted_at = Carbon::now();
        DB::update(
            "Update users set deleted_at=? where id = ?",
                [$deleted_at,$user_id]
        );
    }

}