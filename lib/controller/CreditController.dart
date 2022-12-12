import 'package:get/get.dart';

class CreditController extends GetxController{


  RxInt counter=0.obs;

  increment(){

    counter+=1;

  }

  decrement(){

    counter-=1;

  }


}