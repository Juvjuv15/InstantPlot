<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Property extends Model
{
    public $table = 'properties';
    protected $primaryKey='id';
    public $timestamps = false;
}
