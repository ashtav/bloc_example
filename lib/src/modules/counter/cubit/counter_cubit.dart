import 'package:bloc/bloc.dart';
import 'package:lazyui/lazyui.dart';

/// {@template counter_cubit}
/// A [Cubit] which manages an [int] as its state.
/// {@endtemplate}
class CounterCubit extends Cubit<int> {
  /// {@macro counter_cubit}
  CounterCubit() : super(0) {
    logg('init counter cubit');
    emit(4);
  }

  /// Add 1 to the current state.
  void increment() => emit(state + 1);

  /// Subtract 1 from the current state.
  void decrement() => emit(state - 1);

  // on dispose
  @override
  Future<void> close() {
    logg('dispose counter cubit');
    return super.close();
  }
}
