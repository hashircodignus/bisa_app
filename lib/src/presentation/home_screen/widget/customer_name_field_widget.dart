import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/resources/theme.dart';

class CustomerNameField extends StatelessWidget {
  final String nameText;
  final String companyNameText;
  final IconData? checkedIcon;
  final ImageProvider profileImage;
  final void Function()? onTap;
  const CustomerNameField({required this.nameText,this.onTap, required this.companyNameText,this.checkedIcon ,required this.profileImage,super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 62.h,
        width: 390.w,
        decoration:  BoxDecoration(
          border: Border(bottom: BorderSide(color: AppTheme.smallText,width: 0.5.w))
          //color: Colors.blue
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 50.h,
                  width: 50.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: profileImage,fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(100.r),
                      border: Border.all(color: AppTheme.smallText,width: 0.5.w)
                  ),
                ),
                 SizedBox(width: 12.w,),
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(nameText,style: AppTheme.tabText,),
                           Icon(checkedIcon,color: Colors.green,size: 18.sp,)
                        ],
                      ),
                       SizedBox(height: 6.h,),
                      Text(companyNameText,style: AppTheme.smallHead,)
                    ],
                  ),
                )
              ],
            ),
            // SizedBox(height: 12.h,),
          ],
        ),
      ),
    );
  }
}