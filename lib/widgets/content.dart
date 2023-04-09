import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_bloc/bloc/counter.dart';

class ContentData extends StatelessWidget {
  const ContentData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<Counter>(context),
      builder: (context, state) {
        return Container(
          height: 100,
          width: 200,
          color: Colors.red,
          child: Center(
            child: Text(
              "$state",
              style: const TextStyle(fontSize: 50, color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}
