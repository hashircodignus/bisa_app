import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
part 'selected_country_state.dart';

class SelectedCountryCubit extends Cubit<SelectedCountryState> {
  SelectedCountryCubit() : super(const SelectedCountryInitial());
  final TextEditingController countryController = TextEditingController();
  String selectedCountryCode = '';
  String countryPhoneCode = '';




  void updateSelectedCountry(
      String countryCode, String countryName, String countryPhoneCode) {
    emit(SelectedCountryLoaded(
        countryCode: countryCode,
        countryName: countryName,
        countryPhoneCode: countryPhoneCode));
  }

  String getFlagEmoji() {
    if (selectedCountryCode.isNotEmpty) {
      final int firstLetter =
          selectedCountryCode.codeUnitAt(0) - 0x41 + 0x1F1E6;
      final int secondLetter =
          selectedCountryCode.codeUnitAt(1) - 0x41 + 0x1F1E6;
      return String.fromCharCode(firstLetter) +
          String.fromCharCode(secondLetter);
    }
    return '';
  }
}
