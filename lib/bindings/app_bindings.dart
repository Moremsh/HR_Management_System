import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../data/repositories/auth_repository.dart';

class AppBindings extends Bindings{

  @override
  void dependencies() {
    final _client = Supabase.instance.client;
    Get.put(AuthRepository(client: _client));
  }
}