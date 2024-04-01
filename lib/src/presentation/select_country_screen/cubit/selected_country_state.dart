part of 'selected_country_cubit.dart';

@immutable
abstract class SelectedCountryState {
  const SelectedCountryState();
}

class SelectedCountryInitial extends SelectedCountryState {
  const SelectedCountryInitial();
}

class SelectedCountryLoaded extends SelectedCountryState {
  final String countryCode;
  final String countryName;
  final String countryPhoneCode;

  const SelectedCountryLoaded({
    required this.countryCode,
    required this.countryName,
    required this.countryPhoneCode,
  });
}