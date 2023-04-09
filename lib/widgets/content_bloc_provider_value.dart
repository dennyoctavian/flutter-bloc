import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_bloc/bloc/counter.dart';
import 'package:latihan_bloc/pages/other_page.dart';
import 'package:latihan_bloc/widgets/content.dart';

class ContentBlocProviderValue extends StatelessWidget {
  const ContentBlocProviderValue({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Counter myCounter = context.read<Counter>();
    return Scaffold(
      appBar: AppBar(title: const Text('Bloc Provider')),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
            // builder: (context) => BlocProvider(
            //       create: (context) => myCounter,
            //       child: const OtherPage(),
            //     )));
            builder: (context) => BlocProvider.value(
                  value: myCounter,
                  child: const OtherPage(),
                )));
      }),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Material(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue,
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    BlocProvider.of<Counter>(context).decrement();
                  },
                  child: const SizedBox(
                    height: 100,
                    width: 70,
                    child: Icon(Icons.remove),
                  ),
                ),
              ),
              const ContentData(),
              Material(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    BlocProvider.of<Counter>(context).increment();
                  },
                  child: const SizedBox(
                    height: 100,
                    width: 70,
                    child: Icon(Icons.add),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
