import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/resources/theme.dart';

class CardDetailsContainer extends StatelessWidget {
  final double? height;
  final String cardHead;
  final Widget widget;
  const CardDetailsContainer({ this.height,required this.cardHead,required this.widget,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.h,
      child: Container(
        padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white ,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(cardHead,style: AppTheme.profilePageTab,),
                 Icon(Icons.add_circle,color: Colors.green,size: 20.sp,)
              ],
            ),
            SizedBox(height: 12.h,),
            widget
          ],
        ),
      ),
    );
  }
}

