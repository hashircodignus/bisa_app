part of 'otp_page_cubit.dart';

@immutable
abstract class OtpPageState {}

class OtpPageInitial extends OtpPageState {}
class OtpPageLoading extends OtpPageState {}
class OtpPageSuccess extends OtpPageState {
  final String successText;
  OtpPageSuccess({required this.successText});
}
class OtpPageError extends OtpPageState {
  final String errorText;
  OtpPageError({required this.errorText});
}
class OtpPageUserExists extends OtpPageState {}