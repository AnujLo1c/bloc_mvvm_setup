import 'dart:async';

import 'package:bloc_setup/view_models/controller/user_shared_pref/user_shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/models/google_user_model.dart';
import '../../domain/models/user.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<AppStartedEvent>((event, emit) async {
      await _checkUserSession(event, emit); 
    });
  }

  Future<void> _checkUserSession(AppStartedEvent event, Emitter<SplashState> emit) async {
    final user = await UserSharedPref.getUser(); 
    final googleUser = await UserSharedPref.getGoogleUser();

    await Future.delayed(const Duration(seconds: 3)); 
print(user);
print(googleUser);
if(user!=null){
  emit(SplashCompletedL(user));
}
else if(googleUser!=null){
  emit(SplashCompletedG(googleUser));
}
else{
  emit(SplashCompleted());
}

  }
}
