part of 'splash_bloc.dart';

@immutable
sealed class SplashState {}

final class SplashInitial extends SplashState {}
final class SplashCompletedL extends SplashState {
  final UserModel? userModel;
  SplashCompletedL( this.userModel);
}
final class SplashCompleted extends SplashState {

}
final class SplashCompletedG extends SplashState {
  final GoogleUserModel? googleUserModel;
  SplashCompletedG( this.googleUserModel);
}
