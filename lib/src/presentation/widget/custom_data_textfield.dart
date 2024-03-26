import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/resources/theme.dart';

class CustomDataTextField extends StatelessWidget {
  final String? hintText;
  final Widget? prefixIcon;
  final String? initialValue;
  final Function()? onTap;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final BoxConstraints? prefixIconConstraints;
  const CustomDataTextField({ this.prefixIconConstraints,this.prefixIcon,this.hintText, this.controller,this.initialValue,this.textInputType,this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 59.h,
     // color: Colors.blue,
      child: TextFormField(
        onTap: onTap,
        textAlignVertical: TextAlignVertical.bottom,
        initialValue: initialValue,
        controller: controller,
        cursorColor: AppTheme.textColor,
        style: AppTheme.titleText,
        decoration:  InputDecoration(
            prefixIcon: prefixIcon,
           prefixIconConstraints: prefixIconConstraints,
           // prefixIconConstraints: const BoxConstraints(maxHeight: 15,minWidth: 40),
          suffix: IconButton(onPressed: (){}, icon:  Icon(Icons.clear,color: AppTheme.textColor,size: 20.sp,),alignment: Alignment(0, 0.9),),
            hintText: hintText,
            hintStyle: AppTheme.smallHead,
            enabledBorder:  UnderlineInputBorder(
              borderSide: BorderSide(color: AppTheme.smallText,width: 1.w),
            ),
            focusedBorder:  UnderlineInputBorder(
                borderSide: BorderSide(color: AppTheme.textColor,width: 1.w)
            )
        ),
      ),
    );
  }
}