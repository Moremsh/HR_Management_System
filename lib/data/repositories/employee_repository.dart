import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
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

  Future<String?> pickAndUploadEmployeeImage(String employeeId) async {
    try {
      final ImagePicker picker = ImagePicker();

      // Pick image
      final XFile? pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
      );

      if (pickedFile == null) return null;

      final File imageFile = File(pickedFile.path);
      /// FilePath of the image to Database
      final filePath = 'profiles/$employeeId${imageFile.path}';


      await client.storage
          .from('employee_images')
          .upload(
        filePath,
        imageFile,
        fileOptions: FileOptions(
          upsert: true,
        ),
      );

      /// Public URL
      final imageUrl = client.storage
          .from('employee_images')
          .getPublicUrl(filePath);

      return imageUrl;
    } catch (e) {
      throw 'Image upload failed: ${e.toString()}';
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

  Future<bool> employeeExists(String fullName) async {
    final res = await client
        .from('employees')
        .select()
        .eq('fullName', fullName.trim())
        .maybeSingle();
    print("this is res ${res.toString()}");
    return res != null ;
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
      await client.from('employees').update(employee.toJson()).eq('id', employee.id!);
    }catch(error){
      throw "Something went Wrong ${error.toString()}";
    }
  }

  Future<void> updateSingleValue(Map<String,dynamic> data,String id)async{
    try{
      final res = await client.from('employees').update(data).eq('id', id).select().maybeSingle();
      print(res);
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