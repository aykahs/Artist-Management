<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class MusicRequest extends FormRequest
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
            'title'    => 'required',
            'album_name'    => 'required',
            'genre'    => 'required',
            'artistid'    => 'required'
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
            'album_name' => 'Album name '
        ];
    }
}
