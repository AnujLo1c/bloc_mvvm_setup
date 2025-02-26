import 'package:bloc/bloc.dart';
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
    on<GoogleSignInEvent>((event, emit) async {
      emit(GoogleLoading());
      try {
        User? user = await _googleAuthRepository.signInWithGoogle();
        if (user != null) {
          // print(user);
          emit(GoogleCompleted(user));
        } else {
          emit(GoogleError("Google Sign-In Canceled"));
        }
      } catch (e) {
        emit(GoogleError(e.toString()));
      }
    });
    on<GoogleSignOutEvent>((event, emit) async {
      emit(GoogleLoading());
      try {
      _googleAuthRepository.signOutWithGoogle();
      emit(GoogleSignOut());
      } catch (e) {
        emit(GoogleError(e.toString()));
      }
    });
  }
}

