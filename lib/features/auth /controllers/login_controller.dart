import 'package:employee_data_management/data/repositories/auth_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  static LoginController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final isLoading = false.obs;
  final hidePass = true.obs ;

  Future<void> signInWithEmailAndPassword()async{
    try{
      if(!formKey.currentState!.validate()) return ;
      await AuthRepository.instance.signInWithEmail(email.text, password.text);
    }catch(error){
      throw "Something went wrong ${error.toString()}";
    }
  }

  Future<void> signOut()async{
    try{
      await AuthRepository.instance.signOut();
    }catch(error){
      throw "Something went wrong ${error.toString()}";
    }
  }


}