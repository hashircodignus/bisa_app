import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/resources/theme.dart';

class DetailsTextFormField extends StatelessWidget {
  final String? labelText;
  final String? initialValue;
  const DetailsTextFormField({ this.labelText,this.initialValue,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
     // color: Colors.red,
      height: 59.h,
      width: 390.w,
      child: TextFormField(
        initialValue: initialValue,
        textInputAction: TextInputAction.next,
        style: AppTheme.labelTextBlack,
        cursorColor: AppTheme.textColor,
        decoration: InputDecoration(
            enabledBorder:  UnderlineInputBorder(
                borderSide: BorderSide(color: AppTheme.smallText,width: 0.5.w,style: BorderStyle.solid)
            ),
            focusedBorder:  UnderlineInputBorder(
                borderSide: BorderSide(color: AppTheme.textColor,width: 0.5.w,style: BorderStyle.solid)
            ),
            errorBorder:   UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red,width: 0.5.w,style: BorderStyle.solid)
            ),
            labelText: labelText,
            labelStyle: AppTheme.smallHead
        ),
      ),
    );
  }
}