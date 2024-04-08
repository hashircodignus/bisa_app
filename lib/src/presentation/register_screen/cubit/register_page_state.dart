part of 'register_page_cubit.dart';

@immutable
abstract class RegisterPageState {}

class RegisterPageInitial extends RegisterPageState {}

class RegisterPageLoading extends RegisterPageState {}

class RegisterPageOtpVerification extends RegisterPageState {
  final String verificationSend;
  RegisterPageOtpVerification({required this.verificationSend});
}

class RegisterPageCodeSent extends RegisterPageState {
  final String codeSend;
  RegisterPageCodeSent({required this.codeSend});
}

class RegisterPageSuccess extends RegisterPageState {
  final String successText;
  RegisterPageSuccess({required this.successText});
}

class RegisterPageError extends RegisterPageState {
  final String errorText;
  RegisterPageError({required this.errorText});
}
