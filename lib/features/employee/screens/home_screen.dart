import 'package:employee_data_management/core/common/widgets/horizontal_card.dart';
import 'package:employee_data_management/core/utils/devices/device_utils.dart';
import 'package:employee_data_management/data/repositories/auth_repository.dart';
import 'package:employee_data_management/data/repositories/employee_repository.dart';
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
            icon: Icon(Iconsax.logout_14, color: Colors.white),
          ),
        ],
        backgroundColor: Color(0XFF1C4D8D),
        title: const Text(
          'AGR INTERNATIONAL',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Align(
          alignment: AlignmentGeometry.center,
          child: Row(
            children: [
              /// Search section
              Container(
                height: KDeviceUtils.getScreenHeight(context) - 150,
                width: KDeviceUtils.getScreenWidth(context) / 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      /// Search bar
                      SearchField(),

                      /// Employee Card
                      Obx(
                        () => ListView.builder(
                          itemCount: controller.employees.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              controller.currentEmployee.value =
                                  controller.employees[index];
                              controller.fillFields(
                                controller.currentEmployee.value!,
                              );
                            },
                            child: HorizontalCardContainer(
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
                    color: Colors.white,
                  ),
                  width: KDeviceUtils.getScreenWidth(context) - 150,
                  height: KDeviceUtils.getScreenHeight(context) - 150,
                  child: Form(
                    key: controller.dataFormKey,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 20.0,
                          left: 20,
                          top: 60,
                          bottom: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            /// CRUD Button
                            CrudButtons(),

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
                                            ? NetworkImage(
                                                controller
                                                    .currentEmployee
                                                    .value!
                                                    .image,
                                              )
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
                                          controller.pickAndUploadEmployeeImage(
                                            controller
                                                .currentEmployee
                                                .value!
                                                .id,
                                          );
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
      ),
    );
  }
}

class BottomFormWidget extends StatelessWidget {
  const BottomFormWidget({
    super.key,
    required this.controller,
  });

  final EmployeeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Vacation Details",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 15),

        /// Vacation Details
        Row(
          children: [
            Expanded(
              child: TextWithField(
                text: 'Annual Days',
                controller: controller.annualDays,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: TextWithField(
                text: 'Sick Days',
                controller: controller.sickDays,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: TextWithField(
                text: 'Casual Days',
                controller: controller.casualDays,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: TextWithField(
                text: 'Deduct Days',
                controller: controller.deductDays,
              ),
            ),
          ],
        ),
        KDivider(),

        /// Salary Details
        Text(
          "Salary Details",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: TextWithField(
                text: 'Housing Allowance',
                controller: controller.housingAllowance,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: TextWithField(
                text: 'Transportation Allowance',
                controller:
                    controller.transportationAllowance,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: TextWithField(
                text: 'Base Salary',
                controller: controller.baseSalary,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: TextWithField(
                text: 'Total Salary',
                controller: controller.totalSalary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        KDivider(),
        Text(
          "Excuses Details",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            /// Errand Days
            Expanded(
              child: TextWithField(
                text: 'Errand Days',
                controller: controller.errandDays,
              ),
            ),
            const SizedBox(width: 20),

            /// Exit Days
            Expanded(
              child: TextWithField(
                text: 'Exit Days',
                controller: controller.exitDays,
              ),
            ),
            const SizedBox(width: 20),

            /// Late Days
            Expanded(
              child: TextWithField(
                text: 'Late Days',
                controller: controller.lateDays,
              ),
            ),
          ],
        ),
        const SizedBox(height: 80),
      ],
    );
  }
}

