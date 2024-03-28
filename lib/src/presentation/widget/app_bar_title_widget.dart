import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/resources/theme.dart';

class AppBarTitleWidget extends StatelessWidget {
  final String text;
  const AppBarTitleWidget({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Row(
          children: [
            const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppTheme.textColor,
              size: 20,

            ),
            SizedBox(width: 12.w,),
            Text(
              text,
              style: AppTheme.pageHead,
            )
          ],
        ),
      ),
    );
  }
}