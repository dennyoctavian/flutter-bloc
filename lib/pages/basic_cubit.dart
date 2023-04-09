import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  int initialData;
  CounterCubit({this.initialData = 0}) : super(initialData);

  void tambahData() {
    emit(state + 1);
  }

  void kurangData() {
    emit(state - 1);
  }

  // Observer On Cubit
  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    print(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print(error);
  }
}

class BasicCubit extends StatelessWidget {
  BasicCubit({super.key});

  CounterCubit myCounter = CounterCubit();

  @override
  Widget build(BuildContext context) {
    debugPrint("REBUILD");
    return Scaffold(
      appBar: AppBar(title: const Text('Basic Cubit')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder(
              stream: myCounter.stream,
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: Text(
                      "Loading...",
                      style: TextStyle(fontSize: 50),
                    ),
                  );
                }
                return Center(
                  child: Text(
                    "${snapshot.data}",
                    style: const TextStyle(fontSize: 50),
                  ),
                );
              })),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {
                    myCounter.kurangData();
                  },
                  icon: const Icon(Icons.remove)),
              IconButton(
                  onPressed: () {
                    myCounter.tambahData();
                  },
                  icon: const Icon(Icons.add)),
            ],
          )
        ],
      ),
    );
  }
}
