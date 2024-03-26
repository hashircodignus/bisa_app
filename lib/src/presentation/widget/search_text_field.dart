import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final String hintText;
  final TextStyle hintStyle;
  final Color cursorColor;
  final Widget icon;
  final TextStyle? style;
  const SearchTextField({required this.hintText,required this.cursorColor,required this.icon,required this.hintStyle,this.style,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlignVertical: TextAlignVertical.center,
      cursorColor: cursorColor,
      style: style,
      decoration:  InputDecoration(
          hintText: hintText,
          hintStyle: hintStyle,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          suffixIcon:icon
      ),
    );
  }
}