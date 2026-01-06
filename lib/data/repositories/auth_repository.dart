import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepository extends GetxController{
  static AuthRepository get instance => Get.find();

  final _supaBase = Supabase.instance.client;

  Future<AuthResponse> signInWithEmail(String email,String password)async{
    try{
      final res = await _supaBase.auth.signInWithPassword(email : email , password: password,);
      return res;
    }catch(error){
      throw "Something went Wrong ${error.toString()}";
    }
  }

  Future<void> signOut()async{
    try{
      await _supaBase.auth.signOut();
    }catch(error){
      throw "Something went Wrong ${error.toString()}";
    }
  }


}