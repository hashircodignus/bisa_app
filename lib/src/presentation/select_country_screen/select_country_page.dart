import 'package:bisa_app/src/presentation/terms_and_conditions_screen/terms_and_conditions_page.dart';
import 'package:bisa_app/src/presentation/widget/button_widget.dart';
import 'package:bisa_app/src/utils/resources/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/resources/asset_resources.dart';
import '../widget/country_text_field.dart';

class SelectCountryPage extends StatelessWidget {
  SelectCountryPage({super.key});

  final TextEditingController countryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              CountryTextField(countryController: countryController)
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
                      builder: (context) => const TermsAndConditionsPage()));
            },
          ),
        ));
  }
}
