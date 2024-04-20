import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final String hintText;
  final TextStyle hintStyle;
  final Color cursorColor;
  final Widget? icon;
  final Widget? prefix;
  final TextStyle? style;
  final void Function()? onTap;
  final TextEditingController ?controller;
  final void Function(String)?onChanged;

  const SearchTextField({required this.hintText,required this.cursorColor, this.icon,required this.hintStyle,this.style,this.prefix,
    super.key, this.onTap, this.onChanged, this.controller, 
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged:onChanged ,
      onTap: onTap,
      textAlignVertical: TextAlignVertical.center,
      cursorColor: cursorColor,
      style: style,
      decoration:  InputDecoration(
        contentPadding: EdgeInsets.all(13),
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