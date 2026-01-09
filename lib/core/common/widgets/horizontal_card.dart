import 'package:flutter/material.dart';

import '../../../features/employee/models/employee_model.dart';

class HorizontalCardContainer extends StatelessWidget {
  const HorizontalCardContainer({
    super.key, required this.employee,
  });

  final EmployeeModel employee ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
      child: Container(
        padding: EdgeInsets.all(20),
        height: 120,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey.shade300
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name : ${employee.fullName}',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis
              ),
            ),
            const SizedBox(height: 5,),
            Text(
              'Job Title : ${employee.jobTitle}',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis
              ),
            ),
            const SizedBox(height: 5,),
            Text(
              'Address : ${employee.address}',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis
              ),
            ),
          ],
        ),
      ),
    );
  }
}