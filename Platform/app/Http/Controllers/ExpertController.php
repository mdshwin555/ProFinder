<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Expert;
use App\Models\Consulting;
use App\Http\Controllers\ConsultingController;
use App\Http\Controllers\AuthController;
use Illuminate\Support\Facades\validator;
use Illuminate\Support\Facades\Auth;
class ExpertController extends Controller
{

    public function strExpert(Request $request){

        $validator = Validator::make($request->all(), [
            'user_name' => 'required|string|between:2,100',
            'email' => 'required|string|email|max:100|unique:users',
            'password' => 'required|string|min:6',
            'role' =>'required|string'
        ]);
        if($validator->fails()){
            return response()->json($validator->errors()->toJson(), 400);
        }
        $user = User::create(array_merge(
                    $validator->validated(),
                    ['password' => bcrypt($request->password)]
                ));
        $request ->validate([
            'photo' => 'required',
        ]);
        $photo = $request->photo->getClientOriginalExtension();
        $photo_name = time().'.'.$photo;
        $path = 'images/expert';
        $request->photo->move($path,$photo_name);
        $cons = new ConsultingController();
        $con_id = $cons->strConsult($request);
        $expert = Expert::create([
            'name'=>$request->user_name,
            'photo'=>$photo_name,
            'address'=>$request->address,
            'phone_number'=>$request->phone_number,
            'user_id'=>$user->id,
            'price'=>$request->price,
            'consulting_id'=>$con_id->id

        ]);
        return response()->json([
            'message' => 'expert successfully registered',
            'user' => $user
        ], 200);
    }




public function allexpert(){
$a = Expert::all();
return response()->json($a);
}

    public function viewexperts($id){
        $a = Consulting::with('expert')->where('id',$id)->get();
        return response()->json($a);
    }



    public function viewexpert($id){
        $z = Expert::with('consultings','experienc')->where('id',$id)->get();
        $avg = Expert::find($id)->rate->avg('rate');
        return response()->json([$z,'avg'=>$avg]);
    }



    public function veiwReservation($id){
        $a = Expert::find($id)->reservation;
        return response()->json($a);
    }



    public function viewexpertName( $name){
        return  Expert::where('name',$name)->get();
}



public function viewavg($id){
    $a = Expert::find($id)->rate;
    $avg=$a->avg('rate');
    return response()->json($avg);
  }

}
