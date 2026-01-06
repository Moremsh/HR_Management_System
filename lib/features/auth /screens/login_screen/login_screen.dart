import 'package:employee_data_management/core/utils/devices/device_utils.dart';
import 'package:employee_data_management/features/auth%20/screens/login_screen/widgets/Form_widget_with_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(20)
          ),
          width: KDeviceUtils.getScreenWidth(context)/1.5,
          height: KDeviceUtils.getScreenHeight(context)/1.5,
          child: Padding(
            padding: EdgeInsets.only(top: KDeviceUtils.getAppBarHeight(), left: 24, right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Login ,", style: TextStyle(fontSize: 32,fontWeight: FontWeight.w900),),
                const SizedBox(height: 10,),
                Text("Handle your employee data easly from here by just a click !",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.grey.shade600
                  ),),
                const SizedBox(height: 32,),
                FormWidgetWithBtns()
              ],
            )
          ),
        ),
      ),
    );
  }
}
