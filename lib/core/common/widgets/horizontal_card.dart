import 'package:employee_data_management/features/employee/controllers/employee_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/employee/models/employee_model.dart';

class HorizontalCardContainer extends StatelessWidget {
  const HorizontalCardContainer({
    super.key, required this.employee,required this.controller
  });
  final EmployeeController controller ;
  final EmployeeModel employee ;

  @override
  Widget build(BuildContext context) {
    return Obx(
        ()=> Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
        child: Container(
          padding: const EdgeInsets.all(20),
          height: 120,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: controller.currentEmployee.value?.id == employee.id ?  const Color(0XFF1C4D8D) : Colors.grey.shade300
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name : ${employee.fullName}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                  color: controller.currentEmployee.value?.id == employee.id ? Colors.white.withOpacity(0.9) : Colors.black.withOpacity(0.9)
                ),
              ),
              const SizedBox(height: 5,),
              Text(
                'Job Title : ${employee.jobTitle}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                    color: controller.currentEmployee.value?.id == employee.id ? Colors.white.withOpacity(0.9) : Colors.black.withOpacity(0.9)
                ),
              ),
              const SizedBox(height: 5,),
              Text(
                'Address : ${employee.address}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                    color: controller.currentEmployee.value?.id == employee.id ? Colors.white.withOpacity(0.9) : Colors.black.withOpacity(0.9)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}