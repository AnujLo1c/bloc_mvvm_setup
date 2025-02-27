import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_setup/data/repository/login_repository.dart';
import 'package:bloc_setup/view_models/controller/user_shared_pref/user_shared_pref.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../domain/models/user.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepository loginRepository;
  LoginBloc(this.loginRepository) : super(LoginInitial()) {
    on<LoginUserEvent>(_loginUserEvent );
    on<LogOutEvent>(_logOutEvent);
    on<LoginSessionExistEvent>((event, emit) async {
      emit(LoginCompleted(event.userModel));
    });
  }
  @override
  void onChange(Change<LoginState> change) {
    super.onChange(change);
    print('LoginBloc State Changed: ${change.currentState} → ${change.nextState}');
  }

  Future<void> _loginUserEvent(LoginUserEvent event, Emitter<LoginState> emit) async {

      emit(LoginLoading());
      try{
        Map<String,dynamic> data={
          'username': event.email,
          'password': event.password,
        };
        await loginRepository.loginApi(data).then((value) {
          UserModel userModel=UserModel(token: value['accessToken'], isLogin: true);
          UserSharedPref.saveUser(userModel);
          emit(LoginCompleted(userModel));
        },);
      }
      catch(e){
        emit(LoginError(e.toString()));
      }

  }

  FutureOr<void> _logOutEvent(LogOutEvent event, Emitter<LoginState> emit) {
    LoginState current=state;
    // print(current);
    emit(LoginLoading());
    try{
      if(current is LoginCompleted) {
        UserSharedPref.removeUser();
        emit(LoginCompleted(null));
      }
      emit(LogOutCompleted());
    }
    catch(e){
      emit(LoginError(e.toString()));
    }
  }

}
