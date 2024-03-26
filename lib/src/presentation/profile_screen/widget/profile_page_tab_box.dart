import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/resources/theme.dart';

class ProfilePageTabBox extends StatelessWidget {
  final IconData icon;
  final String text;
  final void Function()? onTap;
  const ProfilePageTabBox({ required this.icon,required this.text,this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: 50.h,
          width: 116.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: AppTheme.backColor,
              boxShadow: const [BoxShadow(
                  color: AppTheme.smallText,
                  blurRadius: 1.5
              )]
          ),
          child: Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon,color: AppTheme.textColor,size: 16.sp,),
               SizedBox(width: 9.w,),
              Text(text,style: AppTheme.profilePageTab,)
            ],
          )
      ),
    );
  }
}