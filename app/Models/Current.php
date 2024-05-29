<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Current extends Model
{
    use HasFactory;

    protected $table = "collection_account";

    protected $fillable = [
        'employee_id',
        'execution_period',
        'end_of_execution_period',
        'number_collection_account',
        'url_file',
        'send_to_email'
    ];

    public function user(){
        return $this->belongsTo(User::class);
    }
}
