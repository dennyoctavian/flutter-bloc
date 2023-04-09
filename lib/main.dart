import 'package:flutter/material.dart';
import 'package:latihan_bloc/pages/bloc_provider_value_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BlocProviderValuePage(),
    );
  }
}
