import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_bloc/bloc/counter.dart';

class BlocBuilderPage extends StatelessWidget {
  const BlocBuilderPage({super.key});

  @override
  Widget build(BuildContext context) {
    Counter counter = Counter();
    debugPrint("REBUILD");
    return Scaffold(
      appBar: AppBar(title: const Text('Bloc Builder')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<Counter, int>(
            bloc: counter,
            buildWhen: (prev, next) {
              //if true terus ngebuild .... jika false tidak ngebuild apa yang di builder
              return true;
            },
            builder: (context, state) {
              return Center(
                child: Text(
                  state.toString(),
                  style: const TextStyle(fontSize: 50),
                ),
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {
                    counter.decrement();
                  },
                  icon: const Icon(Icons.remove)),
              IconButton(
                  onPressed: () {
                    counter.increment();
                  },
                  icon: const Icon(Icons.add)),
            ],
          )
        ],
      ),
    );
  }
}
