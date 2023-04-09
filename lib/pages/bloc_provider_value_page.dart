import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_bloc/bloc/counter.dart';
import 'package:latihan_bloc/pages/other_page.dart';
import 'package:latihan_bloc/widgets/content_bloc_provider_value.dart';

class BlocProviderValuePage extends StatelessWidget {
  const BlocProviderValuePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Counter(),
      child: const ContentBlocProviderValue(),
    );
  }
}
