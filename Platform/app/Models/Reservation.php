<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Expert;
use App\Models\User;
class Reservation extends Model
{
    use HasFactory;
    protected $table='reservations';
    protected $fillable=['period','day','expert_id','user_id'];
    protected $hidden = ['expert_id','user_id'];

    public function expert(){
        return $this->belongsTo(Expert::class,'expert_id');
    }
    public function user(){
        return $this->belongsTo(User::class,'user_id');
    }
}
