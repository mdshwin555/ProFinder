<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Wallet;
use Auth;
use Validator;
class WalletController extends Controller
{
    public function addCredit(Request $request){

        $validator = Validator::make($request->all(), [
        'balance'=>'required|integer',
        ]);
        if($validator->fails()){
            return response()->json($validator->errors()->toJson(), 400);
        }

        $a=Wallet::all();
        foreach($a as $ar){

            if($ar->user_id==Auth::id()){
                $ar->Update([
                   $ar->balance=$request->balance+$ar->balance
                ]);
                return ;
            }

        }
        $a = Wallet::create([
            'balance'=>$request->balance,
            'user_id'=>Auth::id()

        ]);

        return response()->json([
            'message'=>'successfully'
        ]);

    }
}
