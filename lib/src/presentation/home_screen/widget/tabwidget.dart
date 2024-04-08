import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabWidget extends StatefulWidget {
  final String txt;
  const TabWidget({super.key, required this.txt});

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  @override
  Widget build(BuildContext context) {
     {
    return SizedBox(
                              height: 46.h,
                              width: 117.w,
                              child:  Tab(
                                  child: Text(
                                      widget.txt
                              )
                              ),
                            );
  }
}
  }
