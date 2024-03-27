import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/resources/theme.dart';

class AppBarBackButton extends StatelessWidget {
  const AppBarBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>Navigator.of(context).pop(),
      child: Container(
        height: 26.h,
        width: 26.w,
        decoration: BoxDecoration(
            color: AppTheme.smallText,
            borderRadius: BorderRadius.circular(50.r)
        ),
        child: Center(child: Icon(Icons.arrow_back_ios_new_rounded,color: AppTheme.textColor,size: 16.sp,)),
      ),
    );
  }
}