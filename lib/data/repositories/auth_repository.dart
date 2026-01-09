import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../features/auth /screens/login_screen/login_screen.dart';

class AuthRepository extends GetxController{
  static AuthRepository get instance => Get.find();

  final client ;
  AuthRepository({this.client});

  Future<AuthResponse> signInWithEmail(String email,String password)async{
    try{
      final res = await client.auth.signInWithPassword(email : email , password: password,);
      return res;
    }catch(error){
      throw "Something went Wrong ${error.toString()}";
    }
  }

  Future<void> signOut()async{
    try{
      await client.auth.signOut();
      Get.offAll(()=> LoginScreen());
    }catch(error){
      throw "Something went Wrong ${error.toString()}";
    }
  }


}