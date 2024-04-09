import 'package:bisa_app/src/presentation/widget/button_widget.dart';
import 'package:bisa_app/src/presentation/widget/details_text_form_field.dart';
import 'package:bisa_app/src/presentation/widget/full_card_details_widget.dart';
import 'package:bisa_app/src/presentation/widget/subscribe_button.dart';
import 'package:bisa_app/src/utils/resources/asset_resources.dart';
import 'package:bisa_app/src/utils/resources/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FullCardView extends StatefulWidget {
  const FullCardView({super.key});

  @override
  State<FullCardView> createState() => _FullCardViewState();
}

class _FullCardViewState extends State<FullCardView> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 50.h),
          child: const SubscribedButton(buttonTextContent: "Subscribed"),
        ),
        backgroundColor: AppTheme.backColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 315.h,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AssetResources.background),
                        fit: BoxFit.cover)),
                child: Column(children: [
                  SizedBox(
                    height: 40.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 20.sp,
                          )),
                      Text(
                        "My Card",
                        style: AppTheme.pageHead,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          AssetResources.editIcon,
                        ),
                        iconSize: 19.sp,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Container(
                    height: 80.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: AppTheme.smallText, width: 0.5.w),
                      image: const DecorationImage(
                          image: AssetImage(AssetResources.user1Dp),
                          fit: BoxFit.cover),
                      // color: Colors.blue,
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Ameer Khan",
                        style: AppTheme.tabText,
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                    ],
                  ),
                  Text(
                    "Sales Officer",
                    style: AppTheme.smallHead,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(right: 20.w),
                        child: Container(
                          height: 25.h,
                          width: 100.w,
                          //color: Colors.amber,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(AssetResources.whatsApp),
                              Image.asset(AssetResources.instagram),
                              Image.asset(AssetResources.faceBook)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
              SizedBox(
                height: 20.h,
              ),
              FullCardDetailsScreen(
                prefixIcon: SvgPicture.asset(
                  AssetResources.location,
                  fit: BoxFit.none,
                ),
                labelText: "Address",
                //initialValue: "Hazmi Tower\nShanti Nagar,Perithalmana,Kerala",
                keyboardType: TextInputType.multiline,
              ),
              SizedBox(
                height: 20.h,
              ),
              FullCardDetailsScreen(
                prefixIcon: SvgPicture.asset(
                  AssetResources.website,
                  fit: BoxFit.none,
                ),
                labelText: "Website",
                //initialValue: "www.Ameerami.com",
                keyboardType: TextInputType.multiline,
              ),
              SizedBox(
                height: 20.h,
              ),
              FullCardDetailsScreen(
                prefixIcon: SvgPicture.asset(
                  AssetResources.phone,
                  fit: BoxFit.none,
                ),
                labelText: "Phone Number",
                //initialValue: "+9158555656565\n+9775855845525",
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 20.h,
              ),
              FullCardDetailsScreen(
                prefixIcon: SvgPicture.asset(
                  AssetResources.email,
                  fit: BoxFit.none,
                ),
                labelText: "Email",
                //initialValue: "ameer@gmail.com",
                keyboardType: TextInputType.emailAddress,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
