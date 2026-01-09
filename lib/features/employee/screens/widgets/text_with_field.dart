import 'package:employee_data_management/features/employee/controllers/employee_controller.dart';
import 'package:flutter/material.dart';
class TextWithField extends StatelessWidget {
  const TextWithField({
    super.key,required this.text, required this.controller
  });
  final TextEditingController controller ;
  final text ;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$text',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(height: 35,child: TextFormField(textAlignVertical: TextAlignVertical.center,controller: controller,)),
      ],
    );
  }
}