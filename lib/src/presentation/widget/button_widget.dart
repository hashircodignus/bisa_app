import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/resources/theme.dart';

class ButtonWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String buttonTextContent;
  const ButtonWidget({required this.buttonTextContent,this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 59.h,
        width: 390.w,
        decoration: BoxDecoration(
          color: AppTheme.textColor,
          borderRadius: BorderRadius.circular(30.r)
        ),
        child: Padding(padding:  EdgeInsets.symmetric(vertical: 20.h),
        child: Center(child: Text(buttonTextContent,style: AppTheme.buttonText,)),
        ),
      ),
    );
  }
}
