part of 'otp_bloc.dart';

@immutable
abstract class OtpState extends Equatable {
  const OtpState();

  @override
  List<Object?> get props => [];
}

class OtpInitial extends OtpState {}

class OtpLoading extends OtpState {}

class OtpVerified extends OtpState {}

class TimerRunning extends OtpState {
  final int duration;
  const TimerRunning(this.duration);

  @override
  List<Object?> get props => [duration];
}

class TimerCompleted extends OtpState {}