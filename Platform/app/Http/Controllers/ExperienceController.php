<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Experience;
use Validator;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
class ExperienceController extends Controller
{
    public function strExperience(Request $request){


        // $validator = Validator::make($request->all(), [
        //     'experience' => 'required',
        //     'details' => 'required',

        // ]);
        // if($validator->fails()){
        //     return response()->json($validator->errors()->toJson(), 400);
        // }

      //  $s = Experience::all();
      $m =Auth::id();
        $n= User::find($m)->expert;
        foreach($request->experience as $key=>$val){

            $row =[
                'experience'=>$request->experience[$key],
                'details'=>$request->details[$key],
                'expert_id'=>$n->id
            ];

            Experience::insert($row);


                }

                return response()->json([
                    'message'=>'succssfully'
                ]);
            }
    }

