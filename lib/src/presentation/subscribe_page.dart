import 'package:bisa_app/src/presentation/widget/app_bar_title_widget.dart';
import 'package:bisa_app/src/presentation/widget/button_widget.dart';
import 'package:bisa_app/src/presentation/widget/success_screen.dart';
import 'package:bisa_app/src/utils/resources/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubscribePage extends StatelessWidget {
  const SubscribePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backColor,
      appBar: AppBar(
        backgroundColor: AppTheme.backColor,
        automaticallyImplyLeading: false,
        title: const AppBarTitleWidget(text: "Subscribe"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
      ),
      bottomNavigationBar: Padding(padding: EdgeInsets.only(bottom: 50.h,left: 20.w,right: 20.w),
      child:  ButtonWidget(buttonTextContent: "Payment",onPressed: (){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const SuccessPage()), (route) => false);
      },),
      ),
    );
  }
}
