part of 'login_bloc.dart';

@immutable
sealed class LoginEvent extends Equatable{
  @override
  List<Object?> get props => [];
}
final class LoginUserEvent extends LoginEvent{
final String email;
final String password;

  LoginUserEvent({required this.email, required this.password});
@override
  List<Object?> get props => [email,password];
}
final class LogOutEvent extends LoginEvent{


}
final class LoginSessionExistEvent extends LoginEvent {
  final UserModel? userModel;

  LoginSessionExistEvent(this.userModel);
  @override
  // TODO: implement props
  List<Object?> get props => [userModel];
}

