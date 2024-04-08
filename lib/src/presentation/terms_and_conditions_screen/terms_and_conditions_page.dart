import 'dart:developer';
import 'package:bisa_app/src/presentation/register_screen/register_page.dart';
import 'package:bisa_app/src/presentation/widget/button_widget.dart';
import 'package:bisa_app/src/presentation/widget/light_button_widget.dart';
import 'package:bisa_app/src/utils/resources/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widget/appbar_back_button_widget.dart';

class TermsAndConditionsPage extends StatefulWidget {
  const TermsAndConditionsPage({super.key,});

  @override
  State<TermsAndConditionsPage> createState() => _TermsAndConditionsPageState();
}

class _TermsAndConditionsPageState extends State<TermsAndConditionsPage> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backColor,
      appBar: AppBar(
        backgroundColor: AppTheme.backColor,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: const AppBarBackButton(),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Terms of Services",
                style: AppTheme.headText,
              ),
              Text(
                "Last Updates on April 2023",
                style: AppTheme.smallHead,
              ),
              SizedBox(
                height: 25.h,
              ),
              Text(
                "Summary",
                style: AppTheme.tabText,
              ),
              Text(
                "These Terms and Conditions ("
                "Terms"
                ") govern your use of the Index pro mobile application ("
                "App"
                "), provided to you by Index pro. By downloading, installing, or using the App, you agree to be bound by these Terms. If you do not agree to these Terms, you may not use the App.",
                style: AppTheme.smallHead,
              ),
              SizedBox(
                height: 25.h,
              ),
              Text(
                "License",
                style: AppTheme.tabText,
              ),
              Text(
                "These Terms and Conditions ("
                "Terms"
                ") govern your use of the Index pro mobile application ("
                "App"
                "), provided to you by Index pro. By downloading, installing, or using the App, you agree to be bound by these Terms. If you do not agree to these Terms, you may not use the App.",
                style: AppTheme.smallHead,
              ),
              SizedBox(
                height: 25.h,
              ),
              Text(
                "Privacy",
                style: AppTheme.tabText,
              ),
              Text(
                "Privacy Policy: Your use of the App is also governed by our Privacy Policy, which can be found [insert link to privacy policy]. By using the App, you consent to the collection, use, and disclosure of your information as described in the Privacy Policy.",
                style: AppTheme.smallHead,
              ),
              SizedBox(
                height: 25.h,
              ),
              Text(
                "Content and Serivces",
                style: AppTheme.tabText,
              ),
              Text(
                "The App may allow you to access and view certain content, including but not limited to, cryptocurrency information, news, and market data ("
                "Content"
                "). The Content is provided for informational purposes only and should not be considered financial or investment advice.",
                style: AppTheme.smallHead,
              ),
              SizedBox(
                height: 25.h,
              ),
              Row(
                children: [
                  Checkbox(
                    checkColor: AppTheme.backColor,
                    activeColor: AppTheme.textColor,
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        log('message');
                        isChecked = !isChecked;
                        log('isChecked value ==>> $isChecked');
                      });
                    },
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Text(
                    "Accept Terms & Conditions",
                    style: AppTheme.labelTextBlack,
                  )
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 50.h),
        child: isChecked == true
            ? ButtonWidget(
                buttonTextContent: "CONTINUE",
                onPressed: () {
                 showDialog(
                     context: context,
                     barrierDismissible: false,
                     builder: (BuildContext context){
                       return Center(
                         child: CircularProgressIndicator(
                           color: AppTheme.textColor,
                         ),
                       );
                     },
                 );
                 Future.delayed(Duration(seconds: 2),(){
                   Navigator.pop(context);
                   Navigator.push(
                       context,
                       MaterialPageRoute(
                           builder: (context) => RegisterPage()));
                 });
                },
              )
            : const LightButtonWidget(buttonTextContent: "CONTINUE"),
      ),
    );
  }
}
