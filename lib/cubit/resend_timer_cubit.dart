import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResendTimerCubit extends Cubit<int> {
  Timer? _timer;
  final int initialTime;

  ResendTimerCubit({this.initialTime = 30}) : super(initialTime);

  void startTimer() {
    _timer?.cancel();
    emit(initialTime);

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state > 0) {
        emit(state - 1);
      } else {
        timer.cancel();
      }
    });
  }

  void resetTimer() {
    _timer?.cancel();
    emit(initialTime);
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
