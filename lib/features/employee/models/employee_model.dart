import 'package:employee_data_management/features/employee/models/mounthly_excusses_model.dart';
import 'package:employee_data_management/features/employee/models/salary_model.dart';
import 'package:employee_data_management/features/employee/models/vacation_model.dart';
class EmployeeModel {
  final String id ,fullName , phoneNo , image ,address , jobTitle , location ;
  final DateTime dateOfBirth , startDate , graduation;
  final SalaryModel salary ;
  final VacationModel vacation ;
  final MounthlyExcussesModel monthExcusses ;


  EmployeeModel({
    required this.id,
    required this.fullName,
    required this.phoneNo,
    required this.image,
    required this.address,
    required this.jobTitle,
    required this.location,
    required this.dateOfBirth,
    required this.startDate,
    required this.graduation,
    required this.salary,
    required this.vacation,
    required this.monthExcusses,
  });
}