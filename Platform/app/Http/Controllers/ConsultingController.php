<?php

namespace App\Http\Controllers;
use App\Models\Consulting;
use Illuminate\Http\Request;
use Validator;
class ConsultingController extends Controller
{
    public function strConsult($request){

        $request -> validate([

            'consuiting'=>'required'
        ]);


        $s=Consulting::all();
        foreach($s as $re){
            if($re->consuiting==$request->consuiting){
                return $re;
            }
        }

        $a=Consulting::create([
            'consuiting'=>$request->consuiting
        ]);

        return $a;
    }

    public function viewConsultings(){

        $a = Consulting::all();
        return response()->json($a);
    }

    public function viewConsultingName($name){

        return Consulting::where('consuiting',$name)->get();
    }

}
