import 'package:employee_data_management/core/utils/devices/device_utils.dart';
import 'package:employee_data_management/features/employee/controllers/employee_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../models/employee_model.dart';
import '../../models/mounthly_excusses_model.dart';
import '../../models/salary_model.dart';
import '../../models/vacation_model.dart';

class CrudButtons extends StatelessWidget {
  const CrudButtons({super.key, required this.controller});

  final EmployeeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: SizedBox(
          width: controller.currentEmployee.value!.id == ''
              ? KDeviceUtils.getScreenWidth(context) / 8
              : KDeviceUtils.getScreenWidth(context) / 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              /// Add Button
              controller.currentEmployee.value!.id == ''
                  ? Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0XFF5CB338),
                          side: BorderSide(color: Color(0XFF5CB338)),
                        ),
                        onPressed: () => controller.addEmployee(
                          EmployeeModel(
                            fullName: controller.name.text.trim(),
                            phoneNo: controller.phoneNo.text.trim(),
                            image: controller.currentEmployee.value!.image,
                            address: controller.address.text.trim(),
                            jobTitle: controller.jobTitle.text.trim(),
                            location: controller.location.text.trim(),
                            dateOfBirth: controller.dateOfBirth.text.trim(),
                            startDate: controller.dateOfCommencement.text
                                .trim(),
                            graduationDate: controller.graduationDate.text
                                .trim(),
                            salary: SalaryModel(
                              housingAllowance: controller.parseIntSafe(
                                controller.housingAllowance.text.trim(),
                              ),
                              transportAllowance: controller.parseIntSafe(
                                controller.transportationAllowance.text.trim(),
                              ),
                              baseSalary: controller.parseIntSafe(
                                controller.baseSalary.text.trim(),
                              ),
                            ),
                            vacation: VacationModel(
                              annualDay: controller.parseIntSafe(
                                controller.annualDays.text.trim(),
                              ),
                              sickDay: controller.parseIntSafe(
                                controller.sickDays.text.trim(),
                              ),
                              casualDay: controller.parseIntSafe(
                                controller.casualDays.text.trim(),
                              ),
                              deductDay: controller.parseIntSafe(
                                controller.deductDays.text.trim(),
                              ),
                            ),
                            monthlyExcusses: MounthlyExcussesModel(
                              lateDay: controller.parseIntSafe(
                                controller.lateDays.text.trim(),
                              ),
                              exitDay: controller.parseIntSafe(
                                controller.exitDays.text.trim(),
                              ),
                              errandDay: controller.parseIntSafe(
                                controller.errandDays.text.trim(),
                              ),
                            ),
                          ),
                        ),
                        child: Text(
                          'Add Employee',
                          style: TextStyle(color: Color(0XFFFDFFF0)),
                        ),
                      ),
                    )
                  : const SizedBox(),
              const SizedBox(width: 10),

              /// Delete Button
              controller.currentEmployee.value!.id != ''
                  ? Expanded(
                      child: ElevatedButton(
                        onPressed: () => controller.deleteEmployee(
                          controller.currentEmployee.value!.id!,
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0XFFCF0F0F),
                          side: BorderSide(color: Color(0XFFCF0F0F)),
                        ),
                        child: Text(
                          "Delete Employee",
                          style: TextStyle(color: Color(0XFFFDFFF0)),
                        ),
                      ),
                    )
                  : const SizedBox(),
              const SizedBox(width: 10),

              /// Edit Button
              controller.currentEmployee.value!.id != ''
                  ? Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0XFFFFC900),
                          side: BorderSide(color: Color(0XFFFFC900)),
                        ),
                        onPressed: () {
                          controller.enableFields.value = true;
                          controller.isEditing.value = true;
                        },
                        child: Text(
                          "Edit Employee",
                          style: TextStyle(color: Color(0XFFFDFFF0)),
                        ),
                      ),
                    )
                  : const SizedBox(),
              const SizedBox(width: 10),

              /// Clear Button
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: IconButton(
                  onPressed: (){
                    controller.clearFields();
                  },
                  icon: Icon(Iconsax.trash),
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
