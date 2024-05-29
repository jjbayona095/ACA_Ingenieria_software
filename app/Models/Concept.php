<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Concept extends Model
{
    use HasFactory;

    protected $table = "concept_description";

    protected $fillable = [
        'description',
        'state'
    ];

    public function user(){
        return $this->belongsTo(User::class);
    }
}
