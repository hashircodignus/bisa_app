import 'package:bisa_app/src/presentation/more_screen/create_card_screen/create_card_page.dart';
import 'package:bisa_app/src/presentation/widget/app_bar_title_widget.dart';
import 'package:bisa_app/src/utils/resources/asset_resources.dart';
import 'package:bisa_app/src/utils/resources/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCardPage extends StatelessWidget {
  const MyCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backColor,
      appBar: AppBar(
        backgroundColor: AppTheme.backColor,
        automaticallyImplyLeading: false,
        title: const AppBarTitleWidget(text: "My Card"),
      ),
      body: Container(
         padding: EdgeInsets.symmetric(horizontal: 20.w),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
           Container(
             padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 24.h),
             height: 111.h,
             decoration:  BoxDecoration(
               borderRadius: BorderRadius.circular(30.r),
               color: AppTheme.cardColor.withOpacity(0.12),
              // image: const DecorationImage(image: AssetImage(AssetResources.background),fit: BoxFit.cover)
             ),
             child: Row(
               children: [
                 Container(
                   height: 63.h,
                   width: 63.w,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(50.r),
                     color: Colors.red,
                     border: Border.all(width: 3.w,color: AppTheme.backColor),
                   ),
                   child: Image.asset(AssetResources.user2Dp,fit: BoxFit.cover,),
                 ),
                 SizedBox(width: 10.w,),
                 Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text("Name",style: AppTheme.pageHead,),
                     SizedBox(height: 5.h,),
                     Text("Designation",style: AppTheme.greenSubText,),
                   ],
                 ),
                 const Expanded(child: Align(
                     alignment: Alignment(1, -1),
                     child: Icon(Icons.check_circle,color: AppTheme.cardColor,)))
               ],
             ),
           ),
            SizedBox(height: 20.h,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateCardPage()));
              },
              child: Container(
                height: 111.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.r),
                  color: AppTheme.backColor,
                  border: Border.all(width: 3.w,color: AppTheme.backColor),
                  boxShadow: [BoxShadow(
                    color: AppTheme.textColor.withOpacity(0.08),
                    spreadRadius: 1,
                    blurRadius: 8
                  ),]
                ),
                child: Center(
                  child: Text("Add New Card",style: AppTheme.smallTextHead,),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
