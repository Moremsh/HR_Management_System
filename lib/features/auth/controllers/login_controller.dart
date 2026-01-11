import 'package:employee_data_management/data/repositories/auth_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/popups/snackbars.dart';
import '../../employee/screens/home_screen.dart';

class LoginController extends GetxController{
  /// Instance of LoginController
  static LoginController get instance => Get.find();

  final SnackBars snackBars = SnackBars();

  final email = TextEditingController();
  final password = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final isLoading = false.obs;
  final hidePass = true.obs ;

  Future<void> signInWithEmailAndPassword()async{
    try{
      if(!formKey.currentState!.validate()) return ;

      final res = await AuthRepository.instance.signInWithEmail(email.text, password.text);
      if(res.user != null){
        email.text = '';
        password.text = '';
        Get.offAll(()=> HomeScreen());
      }
    }catch(error){
      snackBars.errorSnack("Something went wrong ${error.toString()}", "Error");
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