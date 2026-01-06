import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main()async {
  await Supabase.initialize(
    url: 'https://ntwgqrlvbsrlcetangbf.supabase.co',
    anonKey: 'sb_publishable_NNmt0Ty-1FjDR9-KEsM1zg_-0P1l_05',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(),
    );
  }
}

