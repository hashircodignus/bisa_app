import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/resources/theme.dart';

class CustomDataTextField extends StatelessWidget {
  final String? hintText;
  final Widget? prefixIcon;
  final String? initialValue;
  final Function()? onTap;
  final String? fieldHead;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final BoxConstraints? prefixIconConstraints;
  const CustomDataTextField({ this.prefixIconConstraints,this.prefixIcon,this.hintText, this.controller,this.initialValue,this.textInputType,this.onTap,this.fieldHead,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 84.h,
     // color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(fieldHead != null)
            Text(fieldHead!,style: AppTheme.smallHead,),
          SizedBox(height: 6.h,),
          Container(
           // height: 59.h,
           // color: Colors.blue,
            child: TextFormField(
              onTap: onTap,
              textAlignVertical: TextAlignVertical.bottom,
              initialValue: initialValue,
              controller: controller,
              cursorColor: AppTheme.textColor,
              style: AppTheme.titleText,
              decoration:  InputDecoration(
                contentPadding:  EdgeInsets.only(bottom: 40.h),
                  prefixIcon: prefixIcon,
                 prefixIconConstraints: prefixIconConstraints,
                // suffix: IconButton(onPressed: (){}, icon:  Icon(Icons.clear,color: AppTheme.textColor,size: 20.sp,),alignment: const Alignment(0, -1),),
                  hintText: hintText,
                  hintStyle: AppTheme.smallHead,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(color: AppTheme.smallText,width: 1.w),
                  ),
                  focusedBorder:  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide(color: AppTheme.textColor,width: 1.w)
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }
}