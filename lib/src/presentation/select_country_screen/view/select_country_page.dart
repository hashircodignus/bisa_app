import 'package:bisa_app/src/presentation/select_country_screen/cubit/selected_country_cubit.dart';
import 'package:bisa_app/src/presentation/terms_and_conditions_screen/terms_and_conditions_page.dart';
import 'package:bisa_app/src/presentation/widget/button_widget.dart';
import 'package:bisa_app/src/presentation/widget/light_button_widget.dart';
import 'package:bisa_app/src/utils/resources/theme.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/resources/asset_resources.dart';

class SelectCountryPage extends StatefulWidget {
  const SelectCountryPage({super.key});

  @override
  State<SelectCountryPage> createState() => _SelectCountryPageState();
}

class _SelectCountryPageState extends State<SelectCountryPage> {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<SelectedCountryCubit>(context);

    return Scaffold(
        backgroundColor: AppTheme.backColor,
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
                        padding: EdgeInsets.only(
                          top: 35.h,
                          left: 10.w,
                          right: 10.w,
                        ),
                        inputDecoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(80.r),
                                borderSide: BorderSide(color: Colors.black)),
                            contentPadding: EdgeInsets.only(
                              left: 30.w,
                              right: 30.w,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(80.r),
                              borderSide: BorderSide(color: Colors.black),
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
                      bloc.countryController.text = value.name;
                      setState(() {
                        bloc.countryPhoneCode = value.phoneCode;
                        bloc.selectedCountryCode = value.countryCode;
                      });
                    },
                  ),
                  controller: bloc.countryController,
                  cursorColor: AppTheme.textColor,
                  //style: AppTheme.labelTextBlack,
                  readOnly: true,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          bloc.getFlagEmoji(),
                          style: const TextStyle(fontSize: 24),
                        )),
                    suffixIcon: const Icon(
                      Icons.arrow_forward_rounded,
                      color: AppTheme.smallText,
                    ),
                    hintText: "Select Country",
                    hintStyle: AppTheme.smallHead,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.r),
                      borderSide:
                          const BorderSide(color: AppTheme.smallText, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.r),
                      borderSide:
                          const BorderSide(color: AppTheme.textColor, width: 1),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: 50.h, left: 20.w, right: 20.w),
          child: bloc.countryController.text.isNotEmpty
              ? ButtonWidget(
                  buttonTextContent: "GO AHEAD",
                  onPressed: () {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return Center(
                            child: CircularProgressIndicator(
                          color: AppTheme.textColor,
                        ));
                      },
                    );

                    Future.delayed(Duration(seconds: 2), () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocBuilder<
                              SelectedCountryCubit, SelectedCountryState>(
                            builder: (context, state) {
                              if (state is SelectedCountryLoaded) {
                                return const TermsAndConditionsPage();
                              }
                              return Container();
                            },
                          ),
                        ),
                      );
                    });
                  },
                )
              : const LightButtonWidget(buttonTextContent: "GO AHEAD"),
        ));
  }
}
