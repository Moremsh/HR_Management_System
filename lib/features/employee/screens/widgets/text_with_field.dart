import 'package:employee_data_management/core/utils/validators/validator.dart';
import 'package:employee_data_management/features/employee/controllers/employee_controller.dart';
import 'package:flutter/material.dart';
class TextWithField extends StatelessWidget {
  const TextWithField({
    super.key,required this.text, required this.controller, this.validator, required this.enabled
  });
  final TextEditingController controller ;
  final text ;
  final bool enabled ;
  final validator ;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(decoration: InputDecoration(labelText: text),enabled : enabled ,textAlignVertical: TextAlignVertical.center,controller: controller,validator: validator,),
      ],
    );
  }
}