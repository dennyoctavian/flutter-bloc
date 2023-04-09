import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_bloc/bloc/counter.dart';

class BlocListenerPage extends StatelessWidget {
  const BlocListenerPage({super.key});

  @override
  Widget build(BuildContext context) {
    Counter counter = Counter();
    debugPrint("REBUILD");
    return Scaffold(
      appBar: AppBar(title: const Text('Bloc Listener')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocListener<Counter, int>(
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
            child: BlocBuilder<Counter, int>(
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
