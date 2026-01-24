import 'package:employee_data_management/data/repositories/employee_repository.dart';
import 'package:employee_data_management/features/employee/models/employee_model.dart';
import 'package:employee_data_management/features/employee/models/salary_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/popups/snackbars.dart';
class EmployeeController extends GetxController{
  static EmployeeController get instance => Get.find();

  final EmployeeRepository repository ;
  EmployeeController({required this.repository});

  final name = TextEditingController();
  final phoneNo = TextEditingController();
  final address = TextEditingController();
  final dateOfBirth = TextEditingController();
  final jobTitle = TextEditingController();
  final dateOfCommencement = TextEditingController();
  final graduationDate = TextEditingController();
  final location = TextEditingController();
  final annualDays = TextEditingController();
  final sickDays = TextEditingController();
  final casualDays = TextEditingController();
  final deductDays = TextEditingController();
  final lateDays = TextEditingController();
  final exitDays = TextEditingController();
  final errandDays = TextEditingController();
  final housingAllowance = TextEditingController();
  final transportationAllowance = TextEditingController();
  final baseSalary = TextEditingController();
  final totalSalary = TextEditingController();
  final dataFormKey = GlobalKey<FormState>();

  /// Employee Variables
  Rx<EmployeeModel?> currentEmployee = Rx<EmployeeModel?>(EmployeeModel.empty);
  List<EmployeeModel> _allEmployees = [];
  RxList<EmployeeModel> employees = <EmployeeModel>[].obs;
  final RxBool isLoading = false.obs;
  final RxBool isEditing = false.obs;
  final RxBool enableFields = true.obs;



  /// Image Variables
  final RxBool isImageUploading = false.obs;
  SnackBars snackBars = SnackBars();

  /// Search variables
  final searchController = TextEditingController();
  final RxString searchQuery = ''.obs;




  @override
  void onInit() {
    loadEmployees();
    super.onInit();
  }



  int parseIntSafe(String? value) {
    if (value == null) return 0;
    return int.tryParse(value.trim()) ?? 0;
  }


  void clearFields() {
    dataFormKey.currentState!.reset();
    name.clear();
    phoneNo.clear();
    address.clear();
    dateOfBirth.clear();
    jobTitle.clear();
    dateOfCommencement.clear();
    graduationDate.clear();
    location.clear();
    annualDays.clear();
    sickDays.clear();
    casualDays.clear();
    deductDays.clear();
    lateDays.clear();
    exitDays.clear();
    errandDays.clear();
    housingAllowance.clear();
    transportationAllowance.clear();
    baseSalary.clear();
    totalSalary.clear();
    currentEmployee.value = EmployeeModel.empty;
    searchController.clear();
    searchEmployees('');
    enableFields.value = true ;
    isEditing.value = false ;
  }



  void fillFields(EmployeeModel employee){
    name.text = employee.fullName;
    phoneNo.text = employee.phoneNo;
    address.text = employee.address;
    dateOfBirth.text = employee.dateOfBirth;
    jobTitle.text = employee.jobTitle;
    dateOfCommencement.text = employee.startDate;
    graduationDate.text = employee.graduationDate;
    location.text = employee.location;
    annualDays.text = employee.vacation.annualDay.toString();
    sickDays.text = employee.vacation.sickDay.toString();
    casualDays.text = employee.vacation.casualDay.toString();
    deductDays.text = employee.vacation.deductDay.toString();
    lateDays.text = employee.monthlyExcusses.lateDay.toString();
    exitDays.text = employee.monthlyExcusses.exitDay.toString();
    errandDays.text = employee.monthlyExcusses.errandDay.toString();
    housingAllowance.text = employee.salary.housingAllowance.toString();
    transportationAllowance.text = employee.salary.transportAllowance.toString();
    baseSalary.text = employee.salary.baseSalary.toString();
    totalSalary.text = employee.salary.totalSalary.toString();
  }

  Future<void> pickAndUploadEmployeeImage(String? employeeId) async {
    try {

      final imageUrl = await repository.pickAndUploadEmployeeImage(employeeId!);
      if (imageUrl == null) return ;
      await repository.updateSingleValue({"image": imageUrl}, employeeId);

      snackBars.successSnack('Image uploaded successfully', 'Success');
      await loadEmployees();
    } catch (e) {
      snackBars.errorSnack('Image upload failed: ${e.toString()}', 'Error');
    } finally {
      isLoading.value = false;
    }
  }



  Future<void> loadEmployees()async{
    try {
      isLoading.value = true;

      final data = await repository.getEmployees();

      _allEmployees = data;
      employees.value = data;

    } catch (e) {
      snackBars.errorSnack('Failed to load employees', 'Error');
    } finally {
      isLoading.value = false;
    }
  }

  void searchEmployees(String query) {
    searchQuery.value = query;

    if (query.trim().isEmpty) {
      employees.value = _allEmployees;
      return;
    }

    final lowerQuery = query.toLowerCase();

    employees.value = _allEmployees.where((employee) {
      return employee.fullName.toLowerCase().contains(lowerQuery);
    }).toList();
  }

  Future<void> addEmployee(EmployeeModel employee) async {
    try {
      if (!dataFormKey.currentState!.validate()) return;

      final exists = await repository.employeeExists(employee.fullName);

      if (exists) {
        snackBars.warningSnack('Employee ${employee.fullName} already exists ', 'Duplicate');
        return;
      }

      await repository.addEmployee(employee);
      clearFields();

      Get.snackbar(
        padding: EdgeInsets.all(10),
        'Success',
        'Employee added successfully',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      await loadEmployees();
    } catch (e) {
      snackBars.errorSnack('Something went Wrong ${e.toString()}', 'Error');
    }
  }

  Future<void> deleteEmployee(String id)async{
    try{
      await repository.deleteEmployee(id);
      clearFields();
      await loadEmployees();
      snackBars.successSnack('Employee Deleted Successfully ','Success');
    }catch(error){
      snackBars.errorSnack('Something went Wrong ${error.toString()}','Error');
    }
  }

  Future<EmployeeModel> getEmployeeById(String id)async{
    try{
      final employee = await repository.getEmplyeeById(id);
      return employee ;
    }catch(error){
      throw "Something went Wrong ${error.toString()}";
    }
  }

  Future<void> updateEmployee(EmployeeModel employee)async{
    try{
      await repository.updateEmployee(employee);
      snackBars.successSnack('Employee Updated Successfully ','Success');
    }catch(error){
      throw "Something went Wrong ${error.toString()}";
    }
  }

  Future<EmployeeModel> updateCurrentEmployee(EmployeeModel employee) async {
    employee.fullName = name.text.trim();
    employee.phoneNo = phoneNo.text.trim();
    employee.address = address.text.trim();
    employee.dateOfBirth = dateOfBirth.text.trim();
    employee.jobTitle = jobTitle.text.trim();
    employee.location = location.text.trim();
    employee.startDate = dateOfCommencement.text.trim();
    employee.graduationDate = graduationDate.text.trim();
    employee.salary.housingAllowance = parseIntSafe(housingAllowance.text.trim());
    employee.salary.transportAllowance = parseIntSafe(transportationAllowance.text.trim());
    employee.salary.baseSalary = parseIntSafe(baseSalary.text.trim());
    employee.vacation.annualDay = parseIntSafe(annualDays.text.trim());
    employee.vacation.sickDay = parseIntSafe(sickDays.text.trim());
    employee.vacation.casualDay = parseIntSafe(casualDays.text.trim());
    employee.vacation.deductDay = parseIntSafe(deductDays.text.trim());
    employee.monthlyExcusses.exitDay = parseIntSafe(exitDays.text.trim());
    employee.monthlyExcusses.lateDay = parseIntSafe(lateDays.text.trim());
    employee.monthlyExcusses.errandDay = parseIntSafe(errandDays.text.trim());
    return employee ;

  }
}