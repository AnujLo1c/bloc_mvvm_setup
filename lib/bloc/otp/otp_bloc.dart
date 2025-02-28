
import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'otp_event.dart';
part 'otp_state.dart';
class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final Ticker _ticker;
  StreamSubscription<int>? _tickerSubscription;

  OtpBloc({required Ticker ticker})
      : _ticker = ticker,
        super(OtpInitial()) {
    on<ScreenInitialized>(_onAppInitialized);
    on<StartResendTimer>(_startTimer);

    on<UpdateOtp>(_updateOtp);
    on<OtpSuccess>(_otpSuccess);
    on<_TimerTicked>(_onTick);
  }

  void _onAppInitialized(ScreenInitialized event, Emitter<OtpState> emit) {
    add(StartResendTimer());
  }

  void _startTimer(StartResendTimer event, Emitter<OtpState> emit) {
    _tickerSubscription?.cancel();
    emit(TimerRunning(30));

    _tickerSubscription = _ticker.tick(ticks: 30).listen((duration) {
      add(_TimerTicked(duration: duration));
    });
  }

  void _onTick(_TimerTicked event, Emitter<OtpState> emit) {
    if (event.duration > 0) {
      emit(TimerRunning(event.duration));
    } else {
      emit(TimerCompleted());
    }
  }



  void _updateOtp(UpdateOtp event, Emitter<OtpState> emit) {
    emit(OtpLoading());
  }

  void _otpSuccess(OtpSuccess event, Emitter<OtpState> emit) {
    emit(OtpVerified());
  }

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }
}


class Ticker {
  const Ticker();
  Stream<int> tick({required int ticks}) {
    return Stream.periodic(const Duration(seconds: 1), (x) => ticks - x - 1)
        .take(ticks);
  }
}