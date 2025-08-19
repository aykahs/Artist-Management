<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ArtistRequest extends FormRequest
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
            return [
                'name'    => 'required',
                'first_release_year'    => 'required|digits:4',
                'no_of_album_release'    => 'required',
                'dob'    => 'required',
                'gender'    => 'required',
                'address'    => 'required'
                ];
    }
    public function messages()
    {
        return [
            'required'    => 'The :attribute Is Required !',
        ];
    }

    public function attributes()
    {
        return [
            'first_release_year' => 'First release year',
            'no_of_album_release' => 'No of album',
            'dob' => 'Date of Birth'
        ];
    }
}
