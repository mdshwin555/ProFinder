<?php

namespace App\Models;
use App\Models\User;
use App\Models\Consulting;
use App\Models\Time;
use App\Models\Rate;
use App\Models\Expert_Wallet;
use App\Models\Experience;
use App\Models\Favourite;
use App\Models\Reservation;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Expert extends Model
{
    use HasFactory;
    protected $table = 'experts';
    protected $fillable = ['name','photo','user_id','address','price','phone_number','consulting_id'];

    public function user(){
        return $this->belongsTo(User::class,'user_id');
    }

    public function consultings(){
        return $this->belongsTo(Consulting::class,'consulting_id');
    }

    public function experienc(){
        return $this->hasMany(Experience::class,'expert_id');
    }

    // public function expertinformation(){
    //     return $this->hasOne(Expertinformation::class,'expert_id');
    // }

    public function time(){
        return $this->hasMany(Time::class,'expert_id');
    }
    public function rate(){
        return $this->hasMany(Rate::class,'expert_id');
    }

    public function reservation(){
        return $this->hasMany(Reservation::class,'expert_id');
    }
     public function favourite(){
         return $this->hasMany(Favourite::class,'expert_id');
     }



}
