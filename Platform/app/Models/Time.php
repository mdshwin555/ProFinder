<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Expert;
class Time extends Model
{
    use HasFactory;
    protected $table = 'times';
     protected $fillable = ['day','time','reserved','month','num_day','expert_id'];
     protected $hidden = ['reserved','expert_id','updated_at','created_at'];
   // protected $casts = ['times'=>'array'];



    public function expert(){
        return $this->belongsTo(Expert::class,'expert_id');
    }
}
