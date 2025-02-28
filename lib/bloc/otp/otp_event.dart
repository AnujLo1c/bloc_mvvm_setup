part of 'otp_bloc.dart';

@immutable
abstract class OtpEvent {
  const OtpEvent();
}

class ScreenInitialized extends OtpEvent {}

class StartResendTimer extends OtpEvent {}



class UpdateOtp extends OtpEvent {
  final String otp;
  const UpdateOtp(this.otp);
}

class OtpSuccess extends OtpEvent {}

sealed class TimerEvent extends OtpEvent{
  const TimerEvent();
}

final class TimerStarted extends TimerEvent {
  const TimerStarted({required this.duration});
  final int duration;
}

class TimerReset extends TimerEvent {
  const TimerReset();
}

class _TimerTicked extends TimerEvent {
  const _TimerTicked({required this.duration});
  final int duration;
}