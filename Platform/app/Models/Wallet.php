<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\User;
class Wallet extends Model
{
    use HasFactory;
    protected $table = 'wallets';
    protected $fillable = ['balance','user_id'];

    public function user(){
        return $this->belongsTo(User::class,'user_id');
    }
}
