import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../features/employee/models/employee_model.dart';

class EmployeeRepository extends GetxController{
  static EmployeeRepository get instance => Get.find();

  final SupabaseClient client ;
  EmployeeRepository({required this.client});

  Future<List<EmployeeModel>> getEmployees()async{
    try{
      final res = await client.from('employees').select();
      return res.map((employee) => EmployeeModel.fromJson(employee)).toList();
    }catch(error){
      throw "Something went Wrong ${error.toString()}";
    }
  }

  Future<EmployeeModel> getEmplyeeById(String id) async {
    try{
      final res = await client.from('employees').select().eq('id',id).maybeSingle();
      return EmployeeModel.fromJson(res!);
    }catch(error){
      throw "Something went Wrong ${error.toString()}";
    }
  }

  Future<void> addEmployee(EmployeeModel employee)async{
    try{
      await client.from('employees').insert(employee.toJson());
    }catch(error){
      throw "Something went Wrong ${error.toString()}";
    }
  }

  Future<void> updateEmployee(EmployeeModel employee)async{
    try{
      await client.from('employees').update(employee.toJson()).eq('id', employee.id);
    }catch(error){
      throw "Something went Wrong ${error.toString()}";
    }
  }

  Future<void> deleteEmployee(String id)async{
    try{
      await client.from('employees').delete().eq('id', id);
    }catch(error){
      throw "Something went Wrong ${error.toString()}";
    }
  }

}