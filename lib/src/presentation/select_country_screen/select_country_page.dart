import 'package:bisa_app/src/presentation/widget/button_widget.dart';
import 'package:bisa_app/src/utils/resources/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/resources/asset_resources.dart';

class SelectCountryPage extends StatelessWidget {
   SelectCountryPage({super.key});

  final TextEditingController countryController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 20.w,right: 20.w),
        child:  Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 142.h),
              width: double.infinity,
              child: Image(image: const AssetImage(AssetResources.appLogo),height: 39.h,width: 105.w,),
            ),
            SizedBox(height: 100.h,),
            SizedBox(
              height: 92.h,
              child: Column(
                children: [
                  Text("Choose Your Country",style: AppTheme.headText,),
                  Text("Please select your country to help us for\ngive you a better expeirence",style: AppTheme.smallHead,textAlign: TextAlign.center,)
                ],
              ),
            ),
            SizedBox(height: 60.h,),
            SizedBox(
              height: 59.h,
              child: TextFormField(
                controller: countryController,
                cursorColor: AppTheme.textColor,
                style: AppTheme.labelTextBlack,
                readOnly: true,
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.arrow_forward_rounded,color: AppTheme.smallText,),
                  hintText: "Select Country",
                  hintStyle: AppTheme.smallHead,
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 20.h),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.r),
                    borderSide: const BorderSide(color: AppTheme.smallText,width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.r),
                    borderSide: const BorderSide(color: AppTheme.textColor,width: 1),
                  ),
                ),
              ),
            )

          ],
        ),
      ),
      bottomNavigationBar:Padding(
        padding:  EdgeInsets.only(bottom: 50.h,left: 20.w,right: 20.w),
        child: const ButtonWidget(buttonTextContent: "GO AHEAD"),
      )
    );
  }
}
