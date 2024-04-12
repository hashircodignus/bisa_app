import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/resources/theme.dart';


class UserIdTextField extends StatefulWidget {
  final String flag;
  final String countryphoneCode;
  final TextEditingController controller;
  final void Function(String)? onSubmitted;
  final TextInputAction textInputAction;
  const UserIdTextField({
    super.key,
    required this.controller,
    this.onSubmitted,
    required this.textInputAction,
    required this.flag,
    required this.countryphoneCode,
  });

  @override
  State<UserIdTextField> createState() => _UserIdTextFieldState();
}

class _UserIdTextFieldState extends State<UserIdTextField> {
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(behavior: SnackBarBehavior.floating, content: Text(message)));
  }

  bool isEmail(String input) => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(input);

  bool isPhone(String input) =>
      RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')
          .hasMatch(input);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Country code",
          style: AppTheme.smallHead,
        ),
        // SizedBox(height: MediaQuery.sizeOf(context).height*0.006,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 65.h,
                width: 97.w,
                // color: Colors.red,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        _showSnackBar("Enter valid data");
                      }
                      return null;
                    },
                    initialValue: " +${widget.countryphoneCode}",
                  readOnly: true,
                    style: AppTheme.fieldText,
                    decoration: InputDecoration(
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                      prefixIcon: Text(widget.flag),
                      prefixIconConstraints: BoxConstraints(maxWidth: 70.w),
                      suffixIcon:
                          const Icon(Icons.keyboard_arrow_down_rounded),
                      suffixIconConstraints: BoxConstraints(maxWidth: 70.w),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: AppTheme.smallText,
                            width: 1.w,
                            style: BorderStyle.solid),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: AppTheme.textColor,
                            width: 1.w,
                            style: BorderStyle.solid),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.red,
                            width: 0.5.w,
                            style: BorderStyle.solid),
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: AppTheme.textColor,
                            width: 1.w,
                            style: BorderStyle.solid),
                      ),
                    ),
                  ),
                )),
            SizedBox(
              width: 20.w,
            ),
            Expanded(
              child: TextFormField(
                inputFormatters: [LengthLimitingTextInputFormatter(15)],
                keyboardType: TextInputType.phone,
                onFieldSubmitted: widget.onSubmitted,
                textInputAction: widget.textInputAction,
                validator: (value) {
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
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                  
                  hintText: "Enter here...",
                  hintStyle: AppTheme.smallHead,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: AppTheme.smallText,
                        width: 1.w,
                        style: BorderStyle.solid),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: AppTheme.textColor,
                        width: 1.w,
                        style: BorderStyle.solid),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.red,
                        width: 0.5.w,
                        style: BorderStyle.solid),
                  ),
                  focusedErrorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: AppTheme.textColor,
                        width: 1.w,
                        style: BorderStyle.solid),
                  ),
                ),
              ),
            ),
          ],
        ),
        // SizedBox(height: 20.h,),
      ],
    );
  }
}
