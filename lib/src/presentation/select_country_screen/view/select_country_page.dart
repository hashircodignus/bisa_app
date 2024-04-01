import 'package:bisa_app/src/presentation/select_country_screen/cubit/selected_country_cubit.dart';
import 'package:bisa_app/src/presentation/terms_and_conditions_screen/terms_and_conditions_page.dart';
import 'package:bisa_app/src/presentation/widget/button_widget.dart';
import 'package:bisa_app/src/utils/resources/theme.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/resources/asset_resources.dart';

class SelectCountryPage extends StatefulWidget {
  const SelectCountryPage({super.key});

  @override
  State<SelectCountryPage> createState() => _SelectCountryPageState();
}

class _SelectCountryPageState extends State<SelectCountryPage> {
  final TextEditingController countryController = TextEditingController();
  String selectedCountryCode = '';

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

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SelectedCountryCubit(),
      child: Scaffold(
          body: Container(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 142.h),
                  width: double.infinity,
                  child: Image(
                    image: const AssetImage(AssetResources.appLogo),
                    height: 39.h,
                    width: 105.w,
                  ),
                ),
                SizedBox(
                  height: 100.h,
                ),
                SizedBox(
                  height: 92.h,
                  child: Column(
                    children: [
                      Text(
                        "Choose Your Country",
                        style: AppTheme.headText,
                      ),
                      Text(
                        "Please select your country to help us for\ngive you a better expeirence",
                        style: AppTheme.smallHead,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 60.h,
                ),
                SizedBox(
                  height: 59.h,
                  child: TextFormField(
                    onTap: () => showCountryPicker(
                      countryListTheme: CountryListThemeData(
                          inputDecoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(60.r),
                              ),
                              prefixIcon: const Icon(Icons.search),
                              hintText: "Search Country",
                              hintStyle: AppTheme.smallHead),
                          backgroundColor: Colors.white,
                          bottomSheetHeight: double.infinity,
                          borderRadius: BorderRadius.zero),
                      context: context,
                      onSelect: (Country value) {
                        final selectedCountryCubit =
                            context.read<SelectedCountryCubit>();
                        selectedCountryCubit.updateSelectedCountry(
                            value.countryCode, value.name, value.phoneCode);
                        countryController.text = value.name;
                        setState(() {
                          selectedCountryCode = value.countryCode;
                        });
                      },
                    ),
                    controller: countryController,
                    cursorColor: AppTheme.textColor,
                    style: AppTheme.labelTextBlack,
                    readOnly: true,
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            getFlagEmoji(),
                            style: const TextStyle(fontSize: 24),
                          )
                          ),
                      suffixIcon: const Icon(
                        Icons.arrow_forward_rounded,
                        color: AppTheme.smallText,
                      ),
                      hintText: "Select Country",
                      hintStyle: AppTheme.smallHead,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 20.h),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.r),
                        borderSide: const BorderSide(
                            color: AppTheme.smallText, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.r),
                        borderSide: const BorderSide(
                            color: AppTheme.textColor, width: 1),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(bottom: 50.h, left: 20.w, right: 20.w),
            child: ButtonWidget(
              buttonTextContent: "GO AHEAD",
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BlocBuilder<SelectedCountryCubit,
                                    SelectedCountryState>(
                                builder: (context, state) {
                              if (state is SelectedCountryLoaded) {
                                return TermsAndConditionsPage(
                                    flag: getFlagEmoji(),
                                    countryphoneCode: state.countryPhoneCode);
                              }
                              return Container();
                            })));
              },
            ),
          )),
    );
  }
}