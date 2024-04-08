import 'package:bisa_app/src/presentation/more_screen/subscription/model/subscription_model.dart';
import 'package:bisa_app/src/presentation/more_screen/subscription/widgets/subscription_widget.dart';
import 'package:bisa_app/src/presentation/widget/app_bar_title_widget.dart';
import 'package:bisa_app/src/utils/resources/asset_resources.dart';
import 'package:bisa_app/src/utils/resources/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widget/button_widget.dart';

class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({super.key});

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  SubscriptionPlan? selectedPlan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backColor,
      appBar: AppBar(
          backgroundColor: AppTheme.backColor,
        title: const AppBarTitleWidget(text: "Subscription"),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Center(
                child: Container(
                  height: 131.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(AssetResources.backgroundcard),fit: BoxFit.cover),
                      borderRadius: BorderRadiusDirectional.circular(30)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "200.00",
                        style: AppTheme.centerTextWhite,
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "6 Month",
                              style: AppTheme.labelText,
                            ),
                            Text(
                              "Subscribed",
                              style: AppTheme.smallHeadGreen,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    textAlign: TextAlign.start,
                    "Choose other",
                    style: AppTheme.tabText,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                   SubscriptionWidget(),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(padding: EdgeInsets.only(bottom: 50.h,left: 20.w,right: 20.w),
      child: ButtonWidget(buttonTextContent: "Update"),),
    );
  }
}


