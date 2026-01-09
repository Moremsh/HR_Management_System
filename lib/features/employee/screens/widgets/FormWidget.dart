import 'package:employee_data_management/features/employee/controllers/employee_controller.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/validators/validator.dart';
class UpperFormWidget extends StatelessWidget {
  const UpperFormWidget({
    super.key, required this.controller,
  });

  final EmployeeController controller ;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name :',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: controller.name,
                validator: (value) =>
                    KValidator.validateEmptyText(
                      'Full Name',
                      value,
                    ),
              ),
              const SizedBox(height: 30),
              Text(
                'Phone Number :',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.right,
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: controller.phoneNo,
                validator: (value) =>
                    KValidator.validateEmptyText(
                      'Phone Number',
                      value,
                    ),
              ),
              const SizedBox(height: 30),
              Text(
                'Address :',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.right,
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: controller.address,
                validator: (value) =>
                    KValidator.validateEmptyText(
                      'Address',
                      value,
                    ),
              ),
              const SizedBox(height: 30),
              Text(
                'Date Of Birth :',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.right,
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: controller.dateOfBirth,
                validator: (value) =>
                    KValidator.validateEmptyText(
                      'Date Of Birth',
                      value,
                    ),
              ),

            ],
          ),
        ),
        const SizedBox(width: 50,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Job Title :',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: controller.jobTitle,
                validator: (value) =>
                    KValidator.validateEmptyText(
                      'Job Title',
                      value,
                    ),
              ),
              const SizedBox(height: 30),
              Text(
                'Date of Commencement',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.right,
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: controller.dateOfCommencement,
                validator: (value) =>
                    KValidator.validateEmptyText(
                      'Date of Commencement',
                      value,
                    ),
              ),
              const SizedBox(height: 30),
              Text(
                'Graduation Year :',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.right,
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: controller.graduationDate,
                validator: (value) =>
                    KValidator.validateEmptyText(
                      'Graduation Year',
                      value,
                    ),
              ),
              const SizedBox(height: 30),
              Text(
                'Location :',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.right,
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: controller.location,
                validator: (value) =>
                    KValidator.validateEmptyText(
                      'Location',
                      value,
                    ),
              ),

            ],
          ),
        ),
      ],
    );
  }
}