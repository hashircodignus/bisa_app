import 'package:bisa_app/src/presentation/subscribe_page.dart';
import 'package:bisa_app/src/presentation/widget/custom_data_textfield.dart';
import 'package:bisa_app/src/presentation/widget/search_text_field.dart';
import 'package:bisa_app/src/utils/resources/asset_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/resources/theme.dart';
import '../widget/card_details_container_widget.dart';

class CreateCardSecondPage extends StatelessWidget {
  const CreateCardSecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppTheme.backColor,
        appBar: AppBar(
          elevation: 0.h,
          backgroundColor: AppTheme.backColor,
          titleSpacing:-18.w,
          leadingWidth: 60.w,
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon:  Icon(Icons.keyboard_arrow_left_rounded,color:AppTheme.textColor,size: 30.sp,)),
          title: Text("Create Card",style: AppTheme.pageHead,),
        ),
        bottomNavigationBar:Container(
          padding: EdgeInsets.only(bottom: 20.h),
        height: 90.h,
        color: AppTheme.backColor,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              InkWell(
                onTap:(){
                  Navigator.pop(context);
                },
                child: Container(
                  height: 59.h,
                  width: 185.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.r),
                      color: AppTheme.backColor,
                    border: Border.all(width: 0.5.sp,color: AppTheme.textColor)
                  ),
                  child: Center(child: Text("Back",style: AppTheme.fieldText,)),
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const SubscribePage()));
                },
                child: Container(
                  height: 59.h,
                  width: 185.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.r),
                      color: AppTheme.textColor
                  ),
                  child: Center(child: Text("Next",style: AppTheme.buttonText,)),
                ),
              ),
            ],
          ),
        ),
      ),
        body: Container(
          padding:  EdgeInsets.symmetric(horizontal: 20.w),
          color: AppTheme.backColor,
          child:  SingleChildScrollView(
            child: Column(
              children: [
                 CardDetailsContainer(
                 // height: 202.h,
                  cardHead: 'Phone Number',
                  widget: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomDataTextField(prefixIcon: Icon(Icons.phone_outlined,color: AppTheme.textColor,size: 19.sp,),initialValue: "1234567890",hintText: "Phone Number"),
                      CustomDataTextField(prefixIcon: Icon(Icons.phone_outlined,color: AppTheme.textColor,size: 19.sp,),hintText: "Phone Number"),
                      SizedBox(height: 12.h,),
                      Container(
                        padding: EdgeInsets.all(10.sp),
                        height: 40.h,
                        width: 109.w,
                        decoration: BoxDecoration(
                          color: AppTheme.cardColor,
                          borderRadius: BorderRadius.circular(12.r)
                        ),
                        child: Center(
                          child: Row(
                            children: [
                              Text("Add New",style: AppTheme.smallHeadWhite,),
                               Icon(Icons.add,color: AppTheme.backColor,size: 20.sp,)
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ),
                 SizedBox(height: 20.h,),
                 CardDetailsContainer(cardHead: "Email address",
                   // height: 132.h,
                    widget: Column(crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomDataTextField(prefixIcon: Icon(Icons.mail_outline_rounded,color: AppTheme.smallText,size: 19.sp,),hintText: "Email Address"),
                    SizedBox(height: 12.h,),
                    Container(
                      padding: EdgeInsets.all(10.sp),
                      height: 40.h,
                      width: 109.w,
                      decoration: BoxDecoration(
                          color: AppTheme.cardColor,
                          borderRadius: BorderRadius.circular(12.r)
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            Text("Add New",style: AppTheme.smallHeadWhite,),
                            Icon(Icons.add,color: AppTheme.backColor,size: 20.sp,)
                          ],
                        ),
                      ),
                    )
                  ],
                )),
                 SizedBox(height: 20.h,),
                CardDetailsContainer(
                   // height: 207.h,
                    cardHead: "Social media", widget: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomDataTextField(
                      initialValue: "Facebook.com/23345567876",
                      onTap: ()=>showModalBottomSheet(
                        isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          context: context, builder: (BuildContext context){
                      return Padding(
                        padding:  EdgeInsets.only( bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: Container(
                          padding:  EdgeInsets.symmetric(horizontal: 20.w),
                          height: 200.h,
                          decoration:  BoxDecoration(
                            color: AppTheme.backColor,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(26.r),topRight: Radius.circular(26.r))
                          ),
                          child: Column(
                            children: [
                              Container(
                                  margin:  EdgeInsets.only(top: 35.h,),
                                  padding:  EdgeInsets.only(left: 20.w,right: 5.w),
                                  decoration: BoxDecoration(
                                    color: AppTheme.textColor,
                                    borderRadius: BorderRadius.circular(60.r),),
                                  child:   SearchTextField(cursorColor: AppTheme.backColor,
                                    hintText: "Search Icons",
                                    style: AppTheme.smallHeadWhite,
                                    hintStyle: AppTheme.smallHeadWhite,
                                    icon:  const Icon(Icons.search,color: AppTheme.backColor,),
                                  ),
                              ),
                               SizedBox(height: 20.h,),
                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 52.h,
                                    width: 52.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100.r),
                                      image: const DecorationImage(image: AssetImage(AssetResources.faceBook),fit: BoxFit.cover)
                                    ),
                                  ),
                                  Container(
                                    height: 52.h,
                                    width: 52.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100.r),
                                      image: const DecorationImage(image: AssetImage(AssetResources.instagram),fit: BoxFit.cover)
                                    ),
                                  ),
                                  Container(
                                    height: 52.h,
                                    width: 52.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100.r),
                                      image: const DecorationImage(image: AssetImage(AssetResources.whatsApp),fit: BoxFit.cover)
                                    ),
                                  ),
                                  Container(
                                    height: 52.h,
                                    width: 52.h,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100.r),
                                        image: const DecorationImage(image: AssetImage(AssetResources.behance),fit: BoxFit.cover)
                                    ),
                                  ),
                                  Container(
                                    height: 52.h,
                                    width: 52.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100.r),
                                      image: const DecorationImage(image: AssetImage(AssetResources.twitter),fit: BoxFit.cover)
                                    ),
                                  ),
                                  Container(
                                    height: 52.h,
                                    width: 52.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100.r),
                                      image: const DecorationImage(image: AssetImage(AssetResources.linkedIn),fit: BoxFit.cover)
                                    ),
                                  ),
                                ],
                              ),
                               SizedBox(height: 20.h,),
                            ],
                          ),
                        ),
                      );
                    }),
                      prefixIconConstraints:  BoxConstraints(maxWidth: 50.w,maxHeight: 50.h),
                      prefixIcon: Center(
                        child: Container(
                          height: 30.h,
                          width: 30.w,
                          decoration: BoxDecoration(
                            image: const DecorationImage(image: AssetImage(AssetResources.faceBook)),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(100.r),
                            border: Border.all(color: AppTheme.textColor,width: 0.2.w)
                          ),
                        ),
                      ),
                      ),
                    CustomDataTextField(
                     // initialValue: "Facebook.com/23345567876",
                      onTap: ()=>showModalBottomSheet(
                        isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          context: context, builder: (BuildContext context){
                      return Padding(
                        padding:  EdgeInsets.only( bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: Container(
                          padding:  EdgeInsets.symmetric(horizontal: 20.w),
                          height: 200.h,
                          decoration:  BoxDecoration(
                            color: AppTheme.backColor,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(26.r),topRight: Radius.circular(26.r))
                          ),
                          child: Column(
                            children: [
                              Container(
                                  margin:  EdgeInsets.only(top: 35.h,),
                                  padding:  EdgeInsets.only(left: 20.w,right: 5.w),
                                  decoration: BoxDecoration(
                                    color: AppTheme.textColor,
                                    borderRadius: BorderRadius.circular(60.r),),
                                  child:   SearchTextField(cursorColor: AppTheme.backColor,
                                    hintText: "Search Icons",
                                    style: AppTheme.smallHeadWhite,
                                    hintStyle: AppTheme.smallHeadWhite,
                                    icon:  const Icon(Icons.search,color: AppTheme.backColor,),
                                  ),
                              ),
                               SizedBox(height: 20.h,),
                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 52.h,
                                    width: 52.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100.r),
                                      image: const DecorationImage(image: AssetImage(AssetResources.faceBook),fit: BoxFit.cover)
                                    ),
                                  ),
                                  Container(
                                    height: 52.h,
                                    width: 52.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100.r),
                                      image: const DecorationImage(image: AssetImage(AssetResources.instagram),fit: BoxFit.cover)
                                    ),
                                  ),
                                  Container(
                                    height: 52.h,
                                    width: 52.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100.r),
                                      image: const DecorationImage(image: AssetImage(AssetResources.whatsApp),fit: BoxFit.cover)
                                    ),
                                  ),
                                  Container(
                                    height: 52.h,
                                    width: 52.h,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100.r),
                                        image: const DecorationImage(image: AssetImage(AssetResources.behance),fit: BoxFit.cover)
                                    ),
                                  ),
                                  Container(
                                    height: 52.h,
                                    width: 52.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100.r),
                                      image: const DecorationImage(image: AssetImage(AssetResources.twitter),fit: BoxFit.cover)
                                    ),
                                  ),
                                  Container(
                                    height: 52.h,
                                    width: 52.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100.r),
                                      image: const DecorationImage(image: AssetImage(AssetResources.linkedIn),fit: BoxFit.cover)
                                    ),
                                  ),
                                ],
                              ),
                               SizedBox(height: 20.h,),
                            ],
                          ),
                        ),
                      );
                    }),
                      prefixIconConstraints:  BoxConstraints(maxWidth: 50.w,maxHeight: 50.h),
                      prefixIcon: Center(
                        child: Container(
                          height: 30.h,
                          width: 30.w,
                          decoration: BoxDecoration(
                            // image: const DecorationImage(image: AssetImage(AssetResources.faceBook)),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(100.r),
                            border: Border.all(color: AppTheme.textColor,width: 0.2.w)
                          ),
                        ),
                      ),
                      ),
                    SizedBox(height: 12.h,),
                    Container(
                      padding: EdgeInsets.all(10.sp),
                      height: 40.h,
                      width: 109.w,
                      decoration: BoxDecoration(
                          color: AppTheme.cardColor,
                          borderRadius: BorderRadius.circular(12.r)
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            Text("Add New",style: AppTheme.smallHeadWhite,),
                            Icon(Icons.add,color: AppTheme.backColor,size: 20.sp,)
                          ],
                        ),
                      ),
                    )

                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}


