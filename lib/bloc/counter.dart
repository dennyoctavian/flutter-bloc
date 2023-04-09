import 'package:bloc/bloc.dart';

class Counter extends Cubit<int> {
  int init;
  Counter({this.init = 0}) : super(init);

  void increment() => emit(state + 1);

  void decrement() => emit(state - 1);

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
