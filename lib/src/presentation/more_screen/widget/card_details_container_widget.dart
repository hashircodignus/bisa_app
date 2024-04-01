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
    return Container(
      //padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
       // color: Colors.red,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(cardHead,style: AppTheme.smallHead,),

          widget
        ],
      ),
    );
  }
}

