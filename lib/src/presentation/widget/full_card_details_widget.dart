import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/resources/theme.dart';

class FullCardDetailsScreen extends StatelessWidget {
  
  final String? labelText;
  final String? initialValue;
  final Widget? prefixIcon;
  final TextInputType keyboardType;
   FullCardDetailsScreen({
    this.labelText,
    this.initialValue,
    super.key,
    this.prefixIcon,
    required this.keyboardType,
  });

  @override

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
      
        keyboardType: keyboardType,
       maxLines:null,
        // readOnly: true,
       // initialValue: initialValue,
        textInputAction: TextInputAction.newline,
        style: AppTheme.labelTextBlack,
        cursorColor: AppTheme.textColor,
        decoration: InputDecoration(
          
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppTheme.textColor)),
            contentPadding: EdgeInsets.all(4),
            prefixIcon: prefixIcon,
            labelText: labelText,
            labelStyle: AppTheme.smallHead),
      ),
    );
  }
}
