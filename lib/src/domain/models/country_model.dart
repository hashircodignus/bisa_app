// Import necessary packages
import 'package:country_picker/country_picker.dart';

class PhoneNumberValidator {
  // Function to validate phone number length based on country code
  static bool isValidPhoneNumberLength(String phoneNumber, String countryCode) {
    // Define phone number length rules based on country code
    final Map<String, int> countryPhoneNumberLength = {
      'US': 10,
      'UK': 10,
      'DE': 11,
      'IN': 10,
      // Add more country codes and their respective phone number lengths
      // ...
    };

    // Get the expected phone number length for the given country code
    final expectedLength = countryPhoneNumberLength[countryCode];

    // Return false if the country code is not found in the map
    if (expectedLength == null) {
      print('Country code not found in rules');
      return false;
    }

    // Check if the phone number length matches the expected length
    return phoneNumber.length == expectedLength;
  }
}
