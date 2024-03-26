import 'package:flutter/material.dart';

class PopUpAlertDialogBox extends StatelessWidget {
  final Widget widget;
  final double height;
  final Color color;
  const PopUpAlertDialogBox({required this.widget,required this.height,super.key,required this.color});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: const EdgeInsets.all(0),
      content: Container(
        padding: const EdgeInsets.only(left: 20,right: 20),
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child:  widget
      ),
    );
  }
}