import 'package:employee_data_management/features/employee/controllers/employee_controller.dart';
import 'package:employee_data_management/features/employee/screens/widgets/text_with_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../core/common/widgets/dividor.dart';
import '../../../../core/utils/validators/validator.dart';
class UpperFormWidget extends StatelessWidget {
  const UpperFormWidget({
    super.key, required this.controller,
  });

  final EmployeeController controller ;

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWithField(enabled: controller.enableFields.value,controller: controller.name, text: 'Full Name',validator: (value) =>KValidator.validateEmptyText('Full Name', value),),
                const SizedBox(height: 30),
                TextWithField(controller: controller.phoneNo, text: 'Phone Number',validator: (value) =>KValidator.validateEmptyText('Phone Number', value),enabled: controller.enableFields.value,),
                const SizedBox(height: 30),
                TextWithField(text: 'Address',controller: controller.address,validator: (value) => KValidator.validateEmptyText('Address', value),enabled: controller.enableFields.value,),
                const SizedBox(height: 30),
                TextWithField(text: 'Date of Birth',controller: controller.dateOfBirth,validator: (value) => KValidator.validateEmptyText('Date of Birth', value),enabled: controller.enableFields.value,),

              ],
            ),
          ),
          const SizedBox(width: 50,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWithField(enabled: controller.enableFields.value,text: 'Job Title',controller: controller.jobTitle,validator: (value) => KValidator.validateEmptyText('Job Title', value)),
                const SizedBox(height: 30),
                TextWithField(enabled: controller.enableFields.value,text: 'Date of Commencement',controller: controller.dateOfCommencement,validator: (value) => KValidator.validateEmptyText('Date of Commencement', value)),
                const SizedBox(height: 30),
                TextWithField(enabled: controller.enableFields.value,text: 'Graduation Date',controller: controller.graduationDate,validator: (value) => KValidator.validateEmptyText('Graduation Date', value)),
                const SizedBox(height: 30),
                TextWithField(enabled: controller.enableFields.value,text: 'Location',controller: controller.location,validator: (value) => KValidator.validateEmptyText('Location', value)),
              ],
            ),
          ),
        ],
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
    return Obx(
      ()=> Column(
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
                    enabled: controller.enableFields.value,
                    validator: (value)=> KValidator.validateEmptyText('Annual Days', value)
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: TextWithField(
                  enabled: controller.enableFields.value,
                  validator: (value)=> KValidator.validateEmptyText('Sick Days', value),
                  text: 'Sick Days',
                  controller: controller.sickDays,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: TextWithField(
                  enabled: controller.enableFields.value,
                  validator: (value)=> KValidator.validateEmptyText('Casual Days', value),
                  text: 'Casual Days',
                  controller: controller.casualDays,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: TextWithField(
                  enabled: controller.enableFields.value,
                  validator: (value)=> KValidator.validateEmptyText('Deduct Days', value),
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
                  enabled: controller.enableFields.value,
                  validator: (value)=> KValidator.validateEmptyText('Housing Allowance', value),
                  text: 'Housing Allowance',
                  controller: controller.housingAllowance,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: TextWithField(
                  enabled: controller.enableFields.value,
                  text: 'Transportation Allowance',
                  validator: (value)=> KValidator.validateEmptyText('Transportation Allowance', value),
                  controller:
                  controller.transportationAllowance,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: TextWithField(
                  enabled: controller.enableFields.value,
                  text: 'Base Salary',
                  validator: (value)=> KValidator.validateEmptyText('Base Salary', value),
                  controller: controller.baseSalary,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: TextWithField(
                  enabled: false,
                  validator: (value){},
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
                  enabled: controller.enableFields.value,
                  validator: (value)=> KValidator.validateEmptyText('Errand Days', value),
                  text: 'Errand Days',
                  controller: controller.errandDays,
                ),
              ),
              const SizedBox(width: 20),

              /// Exit Days
              Expanded(
                child: TextWithField(
                  enabled: controller.enableFields.value,
                  validator: (value)=> KValidator.validateEmptyText('Exit Days', value),
                  text: 'Exit Days',
                  controller: controller.exitDays,
                ),
              ),
              const SizedBox(width: 20),

              /// Late Days
              Expanded(
                child: TextWithField(
                  enabled: controller.enableFields.value,
                  validator: (value)=> KValidator.validateEmptyText('Late Days', value),
                  text: 'Late Days',
                  controller: controller.lateDays,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

