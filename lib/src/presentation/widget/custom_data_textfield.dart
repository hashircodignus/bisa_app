import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/resources/theme.dart';

class CustomDataTextField extends StatelessWidget {
  final Widget? suffixIcon;
  final String? hintText;
  final Widget? prefixIcon;
  final Function()? onTap;
  final String? fieldHead;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final BoxConstraints? prefixIconConstraints;
  const CustomDataTextField({
    this.prefixIconConstraints,
    this.prefixIcon,
    this.hintText,
    this.controller,
    this.textInputType,
    this.onTap,
    this.fieldHead,
    super.key,
    this.validator, this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (fieldHead != null)
            Text(
              fieldHead!,
              style: AppTheme.smallHead,
            ),
          SizedBox(
            height: 6.h,
          ),
          Container(
            child: TextFormField(
              validator: validator,
              onTap: onTap,
              textAlignVertical: TextAlignVertical.bottom,
              controller: controller,
              cursorColor: AppTheme.textColor,
              style: AppTheme.titleText,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 20.h),
                  prefixIcon: prefixIcon,
                  suffixIcon: suffixIcon,
                  prefixIconConstraints: prefixIconConstraints,
                  // suffix: IconButton(onPressed: (){}, icon:  Icon(Icons.clear,color: AppTheme.textColor,size: 20.sp,),alignment: const Alignment(0, -1),),
                  hintText: hintText,
                  hintStyle: AppTheme.smallHead,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide:
                        BorderSide(color: AppTheme.smallText, width: 1.w),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide:
                          BorderSide(color: AppTheme.textColor, width: 1.w)),
                errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12.r),
    borderSide: BorderSide(
    color: Colors.red,
    width: 1.w,
    ),
    ),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide:
                    BorderSide(color: AppTheme.textColor, width: 1.w)),

              ),

            ),
          )
        ],
      ),
    );
  }
}
