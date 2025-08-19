<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class UserRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        if($this->method() == 'POST'){
            return [
                'first_name'    => 'required',
                'last_name'    => 'required',
                'phone'    => 'required|digits:10',
                'dob'    => 'required',
                'gender'    => 'required',
                'address'    => 'required',
                'email'    => ['required', Rule::unique('users', 'email')],
                'username'    => ['required', Rule::unique('users', 'username')],
                'password' => ['required', 'confirmed'],
            ];
        } else {
            return [
                'first_name'    => 'required',
                'last_name'    => 'required',
                'phone'    => 'required|digits:10',
                'dob'    => 'required',
                'gender'    => 'required',
                'address'    => 'required',
                'email'    => ['required', Rule::unique('users', 'email')->ignore($this->id)],
                'username'    => ['required', Rule::unique('users', 'username')->ignore($this->id)],
            ];
        }
    }
    public function messages()
    {
        return [
            'required'    => 'The :attribute Is Required !',
            'email.unique' => 'The :attribute Must Be Unique !',
            'username.unique' => 'The :attribute Must Be Unique !',
            'numeric' => 'The :attribute Must Be Number Format !',
            'phone.max' => 'The :attribute Must Be max 10 Digits !',
            'phone.min' => 'The :attribute Must Be min 10 Digits !',
            'phone.digits' => 'The :attribute Must Be 10 Digits !',
        ];
    }

    public function attributes()
    {
        return [
            'username' => 'Username',
            'first_name' => 'First name',
            'last_name' => 'Last name',
            'phone' => 'Phone no',
            'dob' => 'Date of Birth'
        ];
    }
}
