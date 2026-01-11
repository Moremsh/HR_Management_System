import 'package:employee_data_management/features/employee/controllers/employee_controller.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
class SearchField extends StatelessWidget {
  const SearchField({
    super.key, required this.controller,
  });
  final EmployeeController controller ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ClipRRect(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey.shade200,
          ),
          child: TextField(
            controller: controller.searchController,
            onChanged: controller.searchEmployees,
            maxLines: 1,
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.shade400,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.shade300,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              hintText: 'Search for an employee',
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
              prefixIcon: Icon(Iconsax.search_normal_14),
            ),
          ),
        ),
      ),
    );
  }
}

