import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/resources/theme.dart';

class FullCardDetailsScreen extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final Widget? prefixIcon;
  final TextInputType keyboardType;
   FullCardDetailsScreen({
    this.labelText,
    super.key,
     this.controller,
    this.prefixIcon,
    required this.keyboardType,
  });

  @override

  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.w),
      child: TextFormField(
      controller: controller,
        keyboardType: keyboardType,
       maxLines:null,
        textInputAction: TextInputAction.newline,
        style: AppTheme.labelTextBlack,
        cursorColor: AppTheme.textColor,
        decoration: InputDecoration(
          
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppTheme.textColor)),
            contentPadding: EdgeInsets.all(4.r),
            prefixIcon: prefixIcon,
            labelText: labelText,
            labelStyle: AppTheme.smallHead),
      ),
    );
  }
}
