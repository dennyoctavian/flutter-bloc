import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_bloc/bloc/counter.dart';

class BlocConsumerPage extends StatelessWidget {
  const BlocConsumerPage({super.key});

  @override
  Widget build(BuildContext context) {
    Counter counter = Counter();
    debugPrint("REBUILD");
    return Scaffold(
      appBar: AppBar(title: const Text('Bloc Consumer')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocConsumer<Counter, int>(
            bloc: counter,
            listener: (context, state) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Sudah Mencapai 15"),
                duration: Duration(seconds: 1),
              ));
            },
            listenWhen: (prev, current) {
              if (current == 15) {
                return true;
              } else {
                return false;
              }
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
