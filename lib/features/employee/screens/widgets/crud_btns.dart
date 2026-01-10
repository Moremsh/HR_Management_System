import 'package:employee_data_management/core/utils/devices/device_utils.dart';
import 'package:employee_data_management/features/employee/controllers/employee_controller.dart';
import 'package:flutter/material.dart';

import '../../models/employee_model.dart';
import '../../models/mounthly_excusses_model.dart';
import '../../models/salary_model.dart';
import '../../models/vacation_model.dart';
class CrudButtons extends StatelessWidget {
  const CrudButtons({
    super.key, required this.controller,
  });
  final EmployeeController controller ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: KDeviceUtils.getScreenWidth(context)/3,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(child: ElevatedButton(onPressed: ()=> controller.addEmployee( EmployeeModel(
                fullName: controller.name.text.trim(),
                phoneNo: controller.phoneNo.text.trim(),
                image: controller.currentEmployee.value!.image,
                address: controller.address.text.trim(),
                jobTitle: controller.jobTitle.text.trim(),
                location: controller.location.text.trim(),
                dateOfBirth: controller.dateOfBirth.text.trim(),
                startDate: controller.dateOfCommencement.text.trim(),
                graduationDate: controller.graduationDate.text.trim(),
                salary: SalaryModel(
                    housingAllowance: controller.parseIntSafe(controller.housingAllowance.text.trim())  ,
                    transportAllowance: controller.parseIntSafe(controller.transportationAllowance.text.trim()) ,
                    baseSalary: controller.parseIntSafe(controller.baseSalary.text.trim())
                ),
                vacation: VacationModel(
                    annualDay: controller.parseIntSafe(controller.annualDays.text.trim()),
                    sickDay:   controller.parseIntSafe(controller.sickDays.text.trim()) ,
                    casualDay: controller.parseIntSafe(controller.casualDays.text.trim()) ,
                    deductDay: controller.parseIntSafe(controller.deductDays.text.trim())
                ),
                monthlyExcusses: MounthlyExcussesModel(
                    lateDay: controller.parseIntSafe(controller.lateDays.text.trim()),
                    exitDay:  controller.parseIntSafe(controller.exitDays.text.trim()) ,
                    errandDay: controller.parseIntSafe(controller.errandDays.text.trim())
                )
            ),), child: Text("Add Employee"),)),
            const SizedBox(width: 10,),
            Expanded(child: ElevatedButton(onPressed: ()=> controller.deleteEmployee(controller.currentEmployee.value!.id!), child: Text("Delete Employee"),)),
            const SizedBox(width: 10,),
            Expanded(child: ElevatedButton(onPressed: (){}, child: Text("Update Employee"),)),
          ]
      ),
    );
  }
}