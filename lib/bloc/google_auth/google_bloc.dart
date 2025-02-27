import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_setup/domain/models/google_user_model.dart';
import 'package:bloc_setup/domain/models/user.dart';
import 'package:bloc_setup/view_models/controller/user_shared_pref/user_shared_pref.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';

import '../../data/repository/google_auth_repository.dart';

part 'google_event.dart';
part 'google_state.dart';

class GoogleBloc extends Bloc<GoogleEvent, GoogleState> {
  final GoogleAuthRepository _googleAuthRepository;


  GoogleBloc(this._googleAuthRepository) : super(GoogleInitial()) {
    on<GoogleSignInEvent>(_googleSignInEvent);
    on<GoogleSignOutEvent>(_googleSignOutEvent);
    on<GoogleSessionExistEvent>((event, emit) async {
      emit(GoogleCompleted(event.googleUserModel));
    });
  }

  Future<void> _googleSignInEvent(GoogleSignInEvent event, Emitter<GoogleState> emit) async {
    emit(GoogleLoading());
    try {
      User? user = await _googleAuthRepository.signInWithGoogle();
      if (user != null) {
        // print(user);
        GoogleUserModel googleUserModel= GoogleUserModel.fromFirebaseUser(user);
        UserSharedPref.saveGoogleUser(googleUserModel);
        emit(GoogleCompleted(googleUserModel));
      } else {
        emit(GoogleError("Google Sign-In Canceled"));
      }
    } catch (e) {
      emit(GoogleError(e.toString()));
    }

  }

  FutureOr<void> _googleSignOutEvent(GoogleSignOutEvent event, Emitter<GoogleState> emit) {
    emit(GoogleLoading());
    try {
      _googleAuthRepository.signOutWithGoogle();
      UserSharedPref.clearGoogleUser();
      emit(GoogleSignOut());
    } catch (e) {
      emit(GoogleError(e.toString()));
    }
  }

}

