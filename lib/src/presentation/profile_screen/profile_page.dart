import 'package:bisa_app/src/presentation/profile_screen/widget/profile_page_tab_box.dart';
import 'package:bisa_app/src/utils/resources/asset_resources.dart';
import 'package:bisa_app/src/utils/resources/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widget/details_text_form_field.dart';
import '../widget/pop_up_alert_dialog_box_widget.dart';
import '../widget/pop_up_text_field.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xffF6F6F6),
          leading: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.w),
            child: InkWell(
              onTap: ()=>Navigator.pop(context),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 Row(
                   children: [
                      Icon(Icons.keyboard_arrow_left_rounded,color: AppTheme.textColor,size: 30.sp,),
                     Text("Profile",style: AppTheme.pageHead,),
                   ],
                 ),
                  Text("Verified",style: AppTheme.smallHeadGreen,),
                ],
              ),
            ),
          ),
          bottom: PreferredSize(preferredSize:  Size.square(160.h),
              child: Column(
            children: [
              Container(
                height: 80.h,
                width: 80.w,
                decoration: BoxDecoration(
                    border: Border.all(color: AppTheme.smallText,width: 0.5.w),
                  image: const DecorationImage(image: AssetImage(AssetResources.user1Dp),fit: BoxFit.cover),
                 // color: Colors.blue,
                  borderRadius: BorderRadius.circular(100.r),
                ),
              ),
               SizedBox(height: 12.h,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Full Name",style: AppTheme.tabText,),
                   SizedBox(width: 5.w,),
                   Icon(Icons.check_circle,color: Colors.green,size: 15.h,)
                ],
              ),
                SizedBox(height: 8.h,),
               Text("Sales Officer Designation",style: AppTheme.smallHead,),
               SizedBox(height:20.h,),

            ],
          )),
          leadingWidth: 430.w,
        ),
        body: Container(
          padding:  EdgeInsets.symmetric(horizontal: 20.w),
          child:  SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 SizedBox(height: 12.h,),
                 Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ProfilePageTabBox(icon: Icons.phone_outlined, text: 'MOBILE',
                      onTap: ()=>showModalBottomSheet(
                        isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          context: context, builder: (context){
                      return  Padding(
                        padding:  EdgeInsets.only( bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: Container(
                          height:287.h,
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          decoration: BoxDecoration(
                            color: AppTheme.textColor,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(26.r),topRight: Radius.circular(26.r))
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 35.h,),
                              const PopUpTextField(initialValue: '1234567890', image: AssetImage(AssetResources.callIcon)),
                              SizedBox(height: 20.h,),
                              const PopUpTextField(initialValue: '1234567890', image: AssetImage(AssetResources.callIcon)),
                              SizedBox(height: 20.h,),
                              const PopUpTextField(initialValue: '1234567890', image: AssetImage(AssetResources.callIcon)),
                              SizedBox(height: 35.h,),
                            ],
                          ),
                        ),
                      );
                    }),),
                    ProfilePageTabBox(icon: Icons.mail_outline_rounded, text: 'EMAIL',
                    onTap: ()=>showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        context: context, builder: (context){
                      return  Padding(
                        padding:  EdgeInsets.only( bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          height: 129.h,
                          decoration: BoxDecoration(
                              color: AppTheme.textColor,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(26.r),topRight: Radius.circular(26.r))
                          ),
                          child:  Column(
                            children: [
                              SizedBox(height: 35.h,),
                              PopUpTextField(initialValue: 'codignus@gmail.com', image: AssetImage(AssetResources.gmailIcon)),
                              SizedBox(height: 35.h,),
                            ],
                          ),
                        ),
                      );
                    }),
                    ),
                    ProfilePageTabBox(icon: Icons.language_rounded, text: 'SOCIAL',
                    onTap: ()=>showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        context: context, builder: (context){
                      return  Padding(
                        padding:  EdgeInsets.only( bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          height: 208.h,
                          decoration: BoxDecoration(
                              color: AppTheme.textColor,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(26.r),topRight: Radius.circular(26.r))
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 35.h,),
                               PopUpTextField(
                                  prefix: Image(image: AssetImage(AssetResources.faceBook),),
                                  prefixIconConstraints: BoxConstraints(maxWidth: 23.w,maxHeight: 23.h),
                                  initialValue: 'facebook link', image: AssetImage(AssetResources.socialIcon)),
                              SizedBox(height: 20.h,),
                              PopUpTextField(
                                  prefix: const Image(image: AssetImage(AssetResources.instagram)),
                                  prefixIconConstraints: BoxConstraints(maxWidth: 23.w,maxHeight: 23.h),
                                  initialValue: 'instagram link', image: const AssetImage(AssetResources.socialIcon)),
                              SizedBox(height: 35.h,),
                            ],
                          ),
                        ),
                      );
                    })
                      ,)
                  ],
                ),
                 SizedBox(height: 20.h,),
                Text("Basic Details",style: AppTheme.tabText,),
                 SizedBox(height: 20.h,),
                const DetailsTextFormField(labelText: 'Company Name',initialValue: 'Codignus Technology'),
                const SizedBox(height: 10,),
                const DetailsTextFormField(labelText: 'Address',initialValue: "Kerala, India",),
                const SizedBox(height: 10,),
                const DetailsTextFormField(labelText: 'Business Details',initialValue: "Trading Company",),
                const SizedBox(height: 10,),
                const DetailsTextFormField(labelText: 'Website',initialValue: "www.codignus.com",),
              ],
            ),
          ),
        ),
      ),
    );
  }
}