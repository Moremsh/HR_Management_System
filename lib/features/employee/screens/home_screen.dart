import 'package:employee_data_management/core/common/widgets/horizontal_card.dart';
import 'package:employee_data_management/core/utils/devices/device_utils.dart';
import 'package:employee_data_management/core/utils/validators/validator.dart';
import 'package:employee_data_management/data/repositories/auth_repository.dart';
import 'package:employee_data_management/data/repositories/employee_repository.dart';
import 'package:employee_data_management/features/employee/models/employee_model.dart';
import 'package:employee_data_management/features/employee/models/mounthly_excusses_model.dart';
import 'package:employee_data_management/features/employee/models/salary_model.dart';
import 'package:employee_data_management/features/employee/models/vacation_model.dart';
import 'package:employee_data_management/features/employee/screens/widgets/crud_btns.dart';
import 'package:employee_data_management/features/employee/screens/widgets/search_bar.dart';
import 'package:employee_data_management/features/employee/screens/widgets/text_with_field.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import '../../../core/common/widgets/dividor.dart';
import '../controllers/employee_controller.dart';
import 'widgets/FormWidget.dart';
import 'widgets/rounded_image_with_btn.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final controller = Get.put(
    EmployeeController(repository: EmployeeRepository.instance),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        actionsPadding: EdgeInsets.only(right: 10),
        actions: [
          IconButton(
            onPressed: () => AuthRepository.instance.signOut(),
            icon: Icon(Iconsax.logout_14, color: Color(0XFFFDFFF0)),
          ),
        ],
        backgroundColor: Color(0XFF1C4D8D),
        title: const Text(
          'AGR INTERNATIONAL',
          style: TextStyle(
            color: Color(0XFFFDFFF0),
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25),
        child: Row(
          children: [
            /// Search section
            Container(
              height: KDeviceUtils.getScreenHeight(context) ,
              width: KDeviceUtils.getScreenWidth(context) / 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(0.6)
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /// Search bar
                    SearchField(controller: controller),

                    /// Employee Card
                    Obx(
                      () => ListView.builder(
                        itemCount: controller.employees.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            controller.isEditing.value = false ;
                            controller.enableFields.value = false ;
                            controller.currentEmployee.value = controller.employees[index];
                            controller.fillFields(
                              controller.currentEmployee.value!,
                            );
                          },
                          child: HorizontalCardContainer(
                            controller: controller,
                            employee: controller.employees[index],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 25),

            /// Data section
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white.withOpacity(0.6),
                ),
                width: KDeviceUtils.getScreenWidth(context) ,
                height: KDeviceUtils.getScreenHeight(context),
                child: Form(
                  key: controller.dataFormKey,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        right: 20.0,
                        left: 20,
                        bottom: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          /// CRUD Button
                          CrudButtons(
                            controller: controller,
                          ),

                          /// Upper Form
                          Row(
                            children: [
                              Column(
                                children: [
                                  Obx(
                                    () => RoundedImageWithBtn(
                                      image:
                                          controller
                                                  .currentEmployee
                                                  .value!
                                                  .image !=
                                              ''
                                          ? NetworkImage("${controller.currentEmployee.value!.image}?t=${DateTime.now().millisecondsSinceEpoch}",)
                                          : const AssetImage(
                                              'assets/default.jpeg',
                                            ),
                                      btnText: 'Upload Image',
                                    ),
                                  ),
                                  Container(
                                    width: 250,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        controller.currentEmployee.value!.image = "${controller.pickAndUploadEmployeeImage(controller.currentEmployee.value!.id,)}?t=${DateTime.now().millisecondsSinceEpoch}";
                                      },
                                      child: Text('Upload Image'),
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: UpperFormWidget(
                                  controller: controller,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 32),

                          /// Down Form
                          BottomFormWidget(controller: controller),
                          const SizedBox(height: 10),

                          /// Editing Buttons
                          Obx(
                            ()=> controller.isEditing.value ? Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: SizedBox(
                                width: KDeviceUtils.getScreenWidth(context)/5,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [

                                    /// Discard Button
                                    Expanded(child: ElevatedButton(
                                onPressed: ()async{
                                  controller.updateCurrentEmployee(controller.currentEmployee.value!);
                                  controller.updateEmployee(controller.currentEmployee.value!);
                                  controller.isEditing.value = false ;
                                  controller.enableFields.value = false ;
                                  controller.clearFields();
                                }, child: Text("Confirm"))),
                                    const SizedBox(width: 10,),

                                    /// Discard Button
                                    Expanded( child: ElevatedButton(onPressed: () async{
                                      await controller.loadEmployees();
                                      controller.clearFields();
                                      controller.isEditing.value = false ;
                                      controller.enableFields.value = false ;
                                    }
                                   ,child: Text("Discard"))),
                                  ],
                                ),
                              ),
                            ) : const SizedBox(),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
