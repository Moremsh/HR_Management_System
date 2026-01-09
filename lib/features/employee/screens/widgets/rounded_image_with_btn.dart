import 'package:employee_data_management/features/employee/controllers/employee_controller.dart';
import 'package:employee_data_management/features/employee/models/employee_model.dart';
import 'package:flutter/material.dart';
class RoundedImageWithBtn extends StatelessWidget {
  const RoundedImageWithBtn({
    super.key, required this.image, required this.btnText,
  });
  final ImageProvider image ;
  final String btnText ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Image Container
        Padding(
          padding: const EdgeInsets.only(right: 100 , left: 100,),
          child: Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20)
            ),
            height: 250,
            width: 250,
            child: Image(image: image,fit: BoxFit.cover,),
          ),
        ),
        const SizedBox(height: 18,),
      ],
    );
  }
}