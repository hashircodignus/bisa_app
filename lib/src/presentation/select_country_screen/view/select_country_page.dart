import 'package:bisa_app/src/presentation/select_country_screen/cubit/selected_country_cubit.dart';
import 'package:bisa_app/src/presentation/terms_and_conditions_screen/terms_and_conditions_page.dart';
import 'package:bisa_app/src/presentation/widget/button_widget.dart';
import 'package:bisa_app/src/presentation/widget/light_button_widget.dart';
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
                        padding: EdgeInsets.only(top: 30.h),
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
                      bloc.countryController.text = value.name;
                      setState(() {
                        bloc.countryPhoneCode = value.phoneCode;
                        bloc.selectedCountryCode = value.countryCode;
                      });
                    },
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
                      Navigator.pop(context); // Close the dialog
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
