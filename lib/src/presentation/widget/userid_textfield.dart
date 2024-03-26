import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/resources/theme.dart';
class UserIdTextField extends StatefulWidget {
  final TextEditingController controller;
  final void Function(String)? onSubmitted;
  final TextInputAction textInputAction;
   const UserIdTextField({
    super.key,required this.controller,this.onSubmitted,required this.textInputAction});

  @override
  State<UserIdTextField> createState() => _UserIdTextFieldState();
}

class _UserIdTextFieldState extends State<UserIdTextField> {
  bool isEmail(String input) =>  RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(input);

  bool isPhone(String input) => RegExp(
      r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$'
  ).hasMatch(input);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Email/Mobile",style: AppTheme.titleText,),
        SizedBox(height: 6.h,),
        // SizedBox(height: MediaQuery.sizeOf(context).height*0.006,),
        TextFormField(
          onFieldSubmitted: widget.onSubmitted,
          textInputAction: widget.textInputAction,
          validator: (value){
            if (!isEmail(value!) && !isPhone(value)) {
              return 'Please enter a valid email or phone number.';
            }
            return null;
          },
          style: AppTheme.fieldText,

          cursorColor: AppTheme.textColor,
          enableInteractiveSelection: true,
          controller: widget.controller,
          decoration: InputDecoration(
            //errorStyle: AppTheme.errorTextRed,
            contentPadding: EdgeInsets.symmetric(vertical: 20.h,horizontal: 20.w),
           helperText: " ",
            hintText: "Enter here...",
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
                  color: AppTheme.textColor,width: 1.w,style: BorderStyle.solid),
            ),
          ),
        ),
       // SizedBox(height: 20.h,),
      ],
    );
  }
}