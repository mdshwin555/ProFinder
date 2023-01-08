<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Time;
use App\Models\User;
use App\Models\Wallet;
use App\Models\Expert;
use App\Models\Reservation;
use Illuminate\Support\Facades\validator;
use Illuminate\Support\Facades\Auth;
class ReservationtController extends Controller
{
    public function reserveTime($id){
 $t = date("d");
        $a= Time::find($id);
        $x = User::find(Auth::id())->wallet;

        $e = Expert::find($a->expert_id)->user;
        $f = User::find($e->id)->wallet;
        $p = Expert::find($a->expert_id);
        if($a->day<$t){
            return response()->json([
                'message'=>'Sorry, you have to wait for next week'
            ]);
        }
        if($x->balance<$p->price)
        {
            return response()->json([
                'message'=>'Sorry, you do not have enough balance'
            ]);
        }

        if($a->reserved==1){
            return response()->json([
                'message'=>'Sorry, time is taken'
            ]);
        }

        else {
            $a ->Update([
                $a->reserved =1
            ]);





            $x->Update([
                $x->balance = $x->balance-$p->price
            ]);

             $f->Update([
                $f->balance =  $f->balance+$p->price
                    ]);

            $e = Reservation::create([
                'period'=>$a->time,
                'day'=>$a->day,
                'expert_id'=>$a->expert_id,
                'user_id'=>Auth::id()
            ]);






            return response()->json([
                'message'=>'Reservation successful'
            ]);
        }

    }

    public function deleteReserv($id){

        $s = Expert::find($id)->time;

        foreach($s as $r){

            if($r->reserved==1){
                $r->Update([
                    $r->reserved=0
                ]);
            }
        }

        $c = Expert::find($id)->reservation;
        foreach($c as $r){
            $r->delete();
        }

        return response()->json([
            'message'=>'Deleted Successfully'
        ]);
    }



}
