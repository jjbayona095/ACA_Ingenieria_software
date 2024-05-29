<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Employee extends Model
{
    use HasFactory;

    protected $table = "employees";

    protected $fillable = [
        'name',
        'employment',
        'identification_number',
        'address',
        'city',
        'postal_code',
        'phone_number',
        'email',
        'concept',
        'value',
        'bonus',
        'discount',
        'total',
        'bank',
        'type_account_bank',
        'number_account',
        'consecutive',
        'upload_signature',
        'state'
    ];

    public function user(){
        return $this->belongsTo(User::class);
    }
}
