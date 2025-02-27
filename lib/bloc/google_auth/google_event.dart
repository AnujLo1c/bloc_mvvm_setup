part of 'google_bloc.dart';

@immutable
sealed class GoogleEvent extends Equatable {
  @override
  List<Object?> get props => [];

}
final class GoogleSignInEvent extends GoogleEvent{

}

final class GoogleSignOutEvent extends GoogleEvent{
}
final class GoogleSessionExistEvent extends GoogleEvent{
  final GoogleUserModel googleUserModel;
  GoogleSessionExistEvent({required this.googleUserModel});
}
