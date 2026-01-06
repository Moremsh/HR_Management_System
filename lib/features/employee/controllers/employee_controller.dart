import 'package:employee_data_management/data/repositories/employee_repository.dart';
import 'package:employee_data_management/features/employee/models/employee_model.dart';
import 'package:get/get.dart';
class EmployeeController extends GetxController{
  static EmployeeController get instance => Get.find();

  final EmployeeRepository repository ;
  EmployeeController({required this.repository});

  RxList<EmployeeModel> _employees = <EmployeeModel>[].obs;
  final RxBool _isLoading = false.obs;

  Future<void> loadEmployees()async{
    try{
      _isLoading.value = true ;
      _employees.value = await repository.getEmployees();
      _isLoading.value = false ;
    }catch(error){
      throw "Something went Wrong ${error.toString()}";
    }
  }

  Future<void> addEmployee(EmployeeModel employee)async{
    try{
      await repository.addEmployee(employee);
    }catch(error){
      throw "Something went Wrong ${error.toString()}";
    }
  }

  Future<void> deleteEmployee(String id)async{
    try{
      await repository.deleteEmployee(id);
    }catch(error){
      throw "Something went Wrong ${error.toString()}";
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
    }catch(error){
      throw "Something went Wrong ${error.toString()}";
    }
  }
}