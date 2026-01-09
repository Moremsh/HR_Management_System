import 'package:employee_data_management/core/utils/devices/device_utils.dart';
import 'package:flutter/material.dart';
class CrudButtons extends StatelessWidget {
  const CrudButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: KDeviceUtils.getScreenWidth(context)/3,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(child: ElevatedButton(onPressed: (){}, child: Text("Add Employee"),)),
            const SizedBox(width: 10,),
            Expanded(child: ElevatedButton(onPressed: (){}, child: Text("Delete Employee"),)),
            const SizedBox(width: 10,),
            Expanded(child: ElevatedButton(onPressed: (){}, child: Text("Update Employee"),)),
          ]
      ),
    );
  }
}