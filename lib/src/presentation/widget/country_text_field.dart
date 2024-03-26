import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/resources/theme.dart';

class CountryTextField extends StatelessWidget {
  const CountryTextField({
    super.key,
    required this.countryController,
  });

  final TextEditingController countryController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}