import 'package:employee_data_management/features/employee/models/mounthly_excusses_model.dart';
import 'package:employee_data_management/features/employee/models/salary_model.dart';
import 'package:employee_data_management/features/employee/models/vacation_model.dart';
class EmployeeModel {
  final String? id ;
  final String fullName , phoneNo , image ,address , jobTitle , location ;
  final String dateOfBirth , startDate , graduationDate;
  final SalaryModel salary ;
  final VacationModel vacation ;
  final MounthlyExcussesModel monthlyExcusses ;


  EmployeeModel({
    this.id,
    required this.fullName,
    required this.phoneNo,
    required this.image,
    required this.address,
    required this.jobTitle,
    required this.location,
    required this.dateOfBirth,
    required this.startDate,
    required this.graduationDate,
    required this.salary,
    required this.vacation,
    required this.monthlyExcusses,
  });
  
  static EmployeeModel get empty => EmployeeModel(id: '',image: '',fullName: '',phoneNo: '',address: '',jobTitle: '',location: '',dateOfBirth: '',startDate: '',graduationDate: '',salary: SalaryModel.empty, vacation: VacationModel.empty, monthlyExcusses: MounthlyExcussesModel.empty,);
  
  Map<String,dynamic> toJson(){
    return{
      'fullName' : fullName,
      'phoneNo' : phoneNo,
      'image' : image,
      'address' : address,
      'jobTitle' : jobTitle,
      'location' : location,
      'dateOfBirth' : dateOfBirth,
      'startDate' : startDate,
      'graduationDate' : graduationDate,
      'salary' : salary.toJson(salary),
      'vacation' : vacation.toJson(vacation),
      'monthlyExcusses' : monthlyExcusses.toJson(monthlyExcusses),
    };
  }

  factory EmployeeModel.fromJson(Map<String,dynamic> json){
    return EmployeeModel(
        id: json['id'],
        fullName: json['fullName'],
        phoneNo: json['phoneNo'],
        image: json['image'],
        address: json['address'],
        jobTitle: json['jobTitle'],
        location: json['location'],
        dateOfBirth: json['dateOfBirth'],
        startDate: json['startDate'],
        graduationDate: json['graduationDate'],
        salary: SalaryModel.fromJson(json['salary']),
        vacation: VacationModel.fromJson(json['vacation']),
        monthlyExcusses: MounthlyExcussesModel.fromJson(json['monthlyExcusses'])
    );
  }


}