<?php

namespace App\Http\Controllers;
use App\Models\Favourite;
use App\Models\User;
use App\Models\Expert;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\validator;
use Illuminate\Support\Facades\Auth;
class FavouriteController extends Controller
{
    public function addtofavourite(Request $request)
    {
        $validator = Validator::make($request->all(), [

  'expert_id'=>'required'
        ]);
        if ($validator->fails()) {
            return response()->json($validator->errors()->toJson(), 400);
        }
        $fav=Favourite::create(
            [
                'expert_id'=>$request->expert_id,

            'user_id'=>Auth::id(),

        ]
        );
        return response()->json([
            'message'=>'successfully'
        ]);
    }

     public function showfav()
     {

        $a=  Favourite::where('user_id',Auth::id())->get('expert_id');

         return $a;




}
     }

