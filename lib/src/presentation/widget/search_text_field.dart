import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final String hintText;
  final TextStyle hintStyle;
  final Color cursorColor;
  final Widget? icon;
  final Widget? prefix;
  final TextStyle? style;
  final void Function()? onTap;
  const SearchTextField({required this.hintText,required this.cursorColor, this.icon,required this.hintStyle,this.style,this.prefix,
    super.key, this.onTap, 
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      textAlignVertical: TextAlignVertical.center,
      cursorColor: cursorColor,
      style: style,
      decoration:  InputDecoration(
          hintText: hintText,
          hintStyle: hintStyle,
          prefixIcon: prefix,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          suffixIcon:icon
      ),
    );
  }
}