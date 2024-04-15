import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/resources/theme.dart';

class DetailsTextFormField extends StatelessWidget {
  final String? labelText;
  final TextEditingController? controller;
  const DetailsTextFormField({ this.labelText,this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
     // color: Colors.red,
      height: 59.h,
      width: 390.w,
      child: TextFormField(
        controller: controller,
        readOnly: true,
        textInputAction: TextInputAction.next,
        style: AppTheme.labelTextBlack,
        cursorColor: AppTheme.textColor,
        decoration: InputDecoration(
            enabledBorder:  InputBorder.none,
            focusedBorder:  InputBorder.none,
            errorBorder:   InputBorder.none,
            labelText: labelText,
            labelStyle: AppTheme.smallHead
        ),
      ),
    );
  }
}