import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/resources/theme.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController passController;
  final void Function(String)? onSubmitted;
  final TextInputAction textInputAction;
  const PasswordTextField({super.key,required this.passController,this.onSubmitted,required this.textInputAction});

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool show=true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enableInteractiveSelection: true,
      textAlignVertical: TextAlignVertical.bottom,
      validator: (value){
        if(value!.isEmpty){
          return "Field is mandatory";
        }else if(value.length<6){
          return "Password must have 6 or more characters";
        }
        else{
          return null;
        }
      },
      textInputAction: TextInputAction.done,
      onFieldSubmitted: widget.onSubmitted,
      controller: widget.passController,
      obscureText: show,
      obscuringCharacter: '*',
      style: AppTheme.fieldText,
      cursorColor: AppTheme.textColor,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 20.h,horizontal: 20.w),
        helperText: " ",
        prefixIcon:  Icon(Icons.lock_outline_rounded,color: AppTheme.textColor,size: 19.sp,),
        suffixIcon: IconButton(  onPressed: () {
          setState(() {
            show=!show;
          });
        }, icon: show == true ? Icon(Icons.visibility_outlined,color: AppTheme.smallText,size: 19.sp,): Icon(Icons.visibility_off_outlined,color: AppTheme.smallText,size: 19.sp,)),
        hintText: "Enter Password",
        hintStyle: AppTheme.smallHead,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
          borderSide:  BorderSide(
              color: AppTheme.smallText,width: 0.5.w,style: BorderStyle.solid),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
          borderSide:  BorderSide(
              color: AppTheme.textColor,width: 1.w,style: BorderStyle.solid),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
          borderSide:  BorderSide(
              color: Colors.red,width: 0.5.w,style: BorderStyle.solid),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
          borderSide:  BorderSide(
              color: Colors.red,width: 1.w,style: BorderStyle.solid),
        ),
      ),
    );
  }
}