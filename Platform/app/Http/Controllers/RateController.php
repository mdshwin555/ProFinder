<?php

namespace App\Http\Controllers;
use App\Models\Rate;
use App\Models\Expert;
use Validator;
use Illuminate\Http\Request;

class RateController extends Controller
{
    public function addrate(Request $request,$id){

        $validator = Validator::make($request->all(), [
            'rate' => 'required|integer',
        ]);
        if($validator->fails()){
            return response()->json($validator->errors()->toJson(), 400);
        }

        Rate::create([
            'rate'=>$request->rate,
            'expert_id'=>$id
        ]);
    }


}
