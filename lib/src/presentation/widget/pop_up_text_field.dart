import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/resources/theme.dart';

class PopUpTextField extends StatelessWidget {
  final String initialValue;
  final ImageProvider<Object> image;
  final Widget? prefix;
  final BoxConstraints? prefixIconConstraints;
  const PopUpTextField({required this.initialValue, required this.image,this.prefix,super.key,this.prefixIconConstraints});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
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