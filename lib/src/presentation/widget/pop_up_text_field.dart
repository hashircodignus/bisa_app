import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/resources/theme.dart';

class PopUpTextField extends StatelessWidget {
  final ImageProvider<Object> image;
  final TextEditingController? controller;
  final Widget? prefix;
  final BoxConstraints? prefixIconConstraints;
  const PopUpTextField({ this.controller,required this.image,this.prefix,super.key,this.prefixIconConstraints});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: AppTheme.backColor,
      style: AppTheme.labelTextWhite,
      decoration:  InputDecoration(
        prefixIcon: prefix,
          prefixIconConstraints: prefixIconConstraints,
          suffixIcon: Image(image: image,width: 23.w,height: 23.h,),
          focusedBorder:  UnderlineInputBorder(
            borderSide: BorderSide(color: AppTheme.backColor,width: 0.2.w),
          ),
          enabledBorder:  UnderlineInputBorder(
            borderSide: BorderSide(color: AppTheme.smallText,width: 0.2.w),
          ),
          errorBorder:  UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red,width: 0.2.w),
          )
      ),
    );
  }
}