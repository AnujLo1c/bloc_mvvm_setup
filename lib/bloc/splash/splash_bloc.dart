import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<AppStartedEvent>((event, emit) async {
    await Future.delayed(Duration(seconds: 3));
    _checkUserSession(event, emit);
    },);
  }
  Future<void> _checkUserSession(AppStartedEvent event, Emitter<SplashState> emit) async {
    emit(SplashCompleted());
  }
}
