part of 'login_bloc.dart';

@immutable
sealed class LoginState extends Equatable {
  @override
  List<Object?> get props => [];

}

final class LoginInitial extends LoginState {
}
final class LoginLoading extends LoginState {
}
final class LoginCompleted extends LoginState {
 final UserModel? userModel;
  LoginCompleted(this.userModel);
@override
  List<Object?> get props => [userModel];
}
final class LoginError extends LoginState {
  final String message;

  LoginError(this.message);
  @override

  List<Object?> get props => [message];
}
final class LogOutCompleted extends LoginState {
}
