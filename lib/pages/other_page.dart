import 'package:flutter/material.dart';
import 'package:latihan_bloc/bloc/counter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtherPage extends StatelessWidget {
  const OtherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Other Page"),
      ),
      body: Column(
        children: [
          BlocBuilder<Counter, int>(
            bloc: context.read<Counter>(),
            builder: (context, state) {
              return Text(
                state.toString(),
                style: const TextStyle(fontSize: 50),
              );
            },
          )
        ],
      ),
    );
  }
}
