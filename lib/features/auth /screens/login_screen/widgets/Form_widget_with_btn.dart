import 'package:employee_data_management/core/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../controllers/login_controller.dart';


class FormWidgetWithBtns extends StatelessWidget {
  const FormWidgetWithBtns({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Column(
      children: [
        Form(
          key: controller.formKey,
          child: Column(
            children: [
              TextFormField(
                controller: controller.email,
                validator: (value) => KValidator.validateEmptyText("email", value),
                decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: 'Email'
                ),
              ),
              const SizedBox(height: 20,),
              Obx( ()=> TextFormField(
                validator: (value) => KValidator.validateEmptyText('Password',value),
                controller: controller.password,
                obscureText: controller.hidePass.value,
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                      onPressed: ()=> controller.hidePass.value = !controller.hidePass.value,
                      icon: Icon(controller.hidePass.value ? Iconsax.eye_slash : Iconsax.eye)
                  ),
                  labelText: 'Password',
                ),
              ),
              ),
              Row(
                children: [
                  Checkbox(value: true, onChanged: (value) {}),
                  Text("Remember Me" ,style: Theme.of(context).textTheme.labelSmall,),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 32,),
        SizedBox(width: double.infinity, child: ElevatedButton(onPressed: ()=> controller.signInWithEmailAndPassword(), child: Text("Sign in")),),
      ],
    );
  }
}