import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'selected_country_state.dart';

class SelectedCountryCubit extends Cubit<SelectedCountryState> {
  SelectedCountryCubit() : super(const SelectedCountryInitial());

  void updateSelectedCountry(
      String countryCode, String countryName, String countryPhoneCode) {
    emit(SelectedCountryLoaded(
        countryCode: countryCode,
        countryName: countryName,
        countryPhoneCode: countryPhoneCode));
  }
}
