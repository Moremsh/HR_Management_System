import 'package:employee_data_management/core/config/app_config.dart';
import 'package:employee_data_management/core/utils/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:window_manager/window_manager.dart';
import 'core/bindings/app_bindings.dart';
import 'features/auth/screens/login_screen/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Must add this line for the window_manager plugin to work.
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    windowButtonVisibility: true,
  );

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
    await windowManager.maximize();
  });

  await Supabase.initialize(
    url: AppConfig.SUPABASE_URL,
    anonKey: AppConfig.SUPABASE_ANON_KEY,
  );
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: KAppThemes.lightTheme,
      debugShowCheckedModeBanner: false,
      initialBinding: AppBindings(),
      home: const LoginScreen(),
    );
  }
}
