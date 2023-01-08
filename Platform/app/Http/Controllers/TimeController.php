<?php

namespace App\Http\Controllers;
use App\Models\Time;
use App\Models\User;
use App\Models\Expert;
use Illuminate\Http\Request;
use Auth;
use Validator;
class TimeController extends Controller
{
    public function strtime(Request $request){

    $validator = Validator::make($request->all(), [
        'day' => 'required|integer',
        'from' => 'required|string',
        'to' => 'required|string',
        'period' => 'required|string',
        'month' => 'required|string',
    ]);

    if($validator->fails()){
        return response()->json($validator->errors()->toJson(), 400);
    }

        $from = $request->from;
        $to =$request->to;
        $period = $request->period;

        if((($to-$from)*60 % $period)!=0){

            return response()->json([
                'message'=>'period invalid'
            ],400);
        }
        $m =Auth::id();
        $n= User::find($m)->expert;
        if($period==60||$period==120){
            $e=$from;
            $x=$from;
            for($i=$from*60; $i<$to*60 ; $i+=$period){
                if($period==120){
                $x+=2;
                }
                else {
                    $x++;
                }

                Time::create([
                                'day'=>$request->day,
                                'time'=>$e.'_'.$x,
                                'reserved'=>0,
                                'month'=>$request->month,
                                'expert_id'=>$n->id
                             ]);
                             if($period==120){
                             $e+=2;
                            }
                            else {
                                $e++;
                            }

            }

        }

        else if($period==45){
            $e=$from;
            $a=$from;
            $p=$period;
            $x=0;
            $b=false;
            for($i=$from*60; $i<$to*60 ; $i+=$period){

                if($p==60){
                    $from+=2;
                    $x=$from;
                    $a=$from;
                    $p=0;

                }
                else if($p>60){
                    $from++;
                    $x=$from.':'.($p%60);
                    $a=$from;
                    $a++;
                    $b=true;
                    $p=0;
                }

                else {
                    if($b){
                        $x=$a.':'.'15';
                        $p=15;
                       $b=false;
                    }
                    else {
                    $x=$a.':'.$p;
                    }
                }



                Time::create([
                                'day'=>$request->day,
                                'time'=>$e.'_'.$x,
                                'reserved'=>0,
                                'month'=>$request->month,
                                'expert_id'=>$n->id
                             ]);

                             $e=$x;
                             $p+=$period;

            }
        }

            else if($period<60&&$period!=45){
        $e=$from;
        $a=$from;
        $p=$period;
        $x=0;
        $l=0;
        $m=false;
        for($i=$from*60; $i<$to*60 ; $i+=$period){

            if($p==60){
                $from++;
                $x=$from;
                $a=$from;
                $p=0;

            }
            else if($p>60){
                $from++;
                $l=($p%60);
                $x=$from.':'.$l;
                $a=$from;
                $m=true;
                // $a=$from;
                // $a++;
                $p=0;
            }

            else {
                if($m){
                    $from++;
                    $a++;
                    $x=$a;
                    $p=0;
                    $m=false;
                }
                else{
                $x=$a.':'.$p;
                }
            }



            Time::create([
                            'day'=>$request->day,
                            'time'=>$e.'_'.$x,
                            'reserved'=>0,
                            'month'=>$request->month,
                            'expert_id'=>$n->id
                         ]);

                         $e=$x;
                         $p+=$period;

        }
    }


    else{
     //($period==90)  {
        $e=$from;
        $p=$period;
        $x=0;
        $a=$from;
        $b=false;
        for($i=$from*60; $i<$to*60 ; $i+=$period){


            if($b){

                $from+=2;
                $x = $from;
                    //$a=$from;
                $p=0;
                }
                else{
                    $from++;
                //$a=$from;
                $x=$from.':'.($p%60);
                // $a=$from.':'.($p%60);
                $p=0;
                }






            Time::create([
                            'day'=>$request->day,
                            'time'=>$e.'_'.$x,
                            'reserved'=>0,
                            'month'=>$request->month,
                            'expert_id'=>$n->id
                         ]);

                         $e=$x;
                         $p+=$period;
                         $b=!$b;
                        //  if($p%60==30){
                        //     $from++;
                        //  }

        }
    }

    return response()->json([
        'mseeage'=>'succssfully'
    ]);
}

public function viewTime($id){

     $a =Expert::find($id)->time;
         return response()->json($a);
            }

            public function updatetime(Request $request){
                $m =Auth::id();
                $n= User::find($m)->expert;
                $all = Expert::find($n->id)->time;
                foreach($all as $ar){
                    $ar->delete();
                }
                    $validator = Validator::make($request->all(), [
                        'day' => 'required|integer',
                        'from' => 'required|string',
                        'to' => 'required|string',
                        'period' => 'required|string',
                        'month' => 'required|string'
                    ]);

                    if($validator->fails()){
                        return response()->json($validator->errors()->toJson(), 400);
                    }

                        $from = $request->from;
                        $to =$request->to;
                        $period = $request->period;

                        if((($to-$from)*60 % $period)!=0){

                            return response()->json([
                                'message'=>'period invalid'
                            ]);
                        }

                        if($period==60||$period==120){
                            $e=$from;
                            $x=$from;
                            for($i=$from*60; $i<$to*60 ; $i+=$period){
                                if($period==120){
                                $x+=2;
                                }
                                else {
                                    $x++;
                                }

                                Time::create([
                                    'day'=>$request->day,
                                    'time'=>$e.'_'.$x,
                                    'reserved'=>0,
                                    'month'=>$request->month,
                                    'expert_id'=>$n->id
                                 ]);
                                             if($period==120){
                                             $e+=2;
                                            }
                                            else {
                                                $e++;
                                            }

                            }

                        }

                        else if($period==45){
                            $e=$from;
                            $a=$from;
                            $p=$period;
                            $x=0;
                            $b=false;
                            for($i=$from*60; $i<$to*60 ; $i+=$period){

                                if($p==60){
                                    $from+=2;
                                    $x=$from;
                                    $a=$from;
                                    $p=0;

                                }
                                else if($p>60){
                                    $from++;
                                    $x=$from.':'.($p%60);
                                    $a=$from;
                                    $a++;
                                    $b=true;
                                    $p=0;
                                }

                                else {
                                    if($b){
                                        $x=$a.':'.'15';
                                        $p=15;
                                       $b=false;
                                    }
                                    else {
                                    $x=$a.':'.$p;
                                    }
                                }



                                Time::create([
                                    'day'=>$request->day,
                                    'time'=>$e.'_'.$x,
                                    'reserved'=>0,
                                    'month'=>$request->month,
                                    'expert_id'=>$n->id
                                 ]);

                                             $e=$x;
                                             $p+=$period;

                            }
                        }

                            else if($period<60&&$period!=45){
                        $e=$from;
                        $a=$from;
                        $p=$period;
                        $x=0;
                        $l=0;
                        $m=false;
                        for($i=$from*60; $i<$to*60 ; $i+=$period){

                            if($p==60){
                                $from++;
                                $x=$from;
                                $a=$from;
                                $p=0;

                            }
                            else if($p>60){
                                $from++;
                                $l=($p%60);
                                $x=$from.':'.$l;
                                $a=$from;
                                $m=true;
                                // $a=$from;
                                // $a++;
                                $p=0;
                            }

                            else {
                                if($m){
                                    $from++;
                                    $a++;
                                    $x=$a;
                                    $p=0;
                                    $m=false;
                                }
                                else{
                                $x=$a.':'.$p;
                                }
                            }



                            Time::create([
                                'day'=>$request->day,
                                'time'=>$e.'_'.$x,
                                'reserved'=>0,
                                'month'=>$request->month,
                                'expert_id'=>$n->id
                             ]);

                                         $e=$x;
                                         $p+=$period;

                        }
                    }


                    else{
                     //($period==90)  {
                        $e=$from;
                        $p=$period;
                        $x=0;
                        $a=$from;
                        $b=false;
                        for($i=$from*60; $i<$to*60 ; $i+=$period){


                            if($b){

                                $from+=2;
                                $x = $from;
                                    //$a=$from;
                                $p=0;
                                }
                                else{
                                    $from++;
                                //$a=$from;
                                $x=$from.':'.($p%60);
                                // $a=$from.':'.($p%60);
                                $p=0;
                                }






                                Time::create([
                                    'day'=>$request->day,
                                    'time'=>$e.'_'.$x,
                                    'reserved'=>0,
                                    'month'=>$request->month,
                                    'expert_id'=>$n->id
                                 ]);

                                         $e=$x;
                                         $p+=$period;
                                         $b=!$b;
                                        //  if($p%60==30){
                                        //     $from++;
                                        //  }

                        }
                    }

                    return response()->json([
                        'message'=>'updated successfully'
                    ]);

                }

            }





