import 'package:bisa_app/src/presentation/more_screen/subscription/widgets/subscription_widget.dart';
import 'package:bisa_app/src/presentation/widget/app_bar_title_widget.dart';
import 'package:bisa_app/src/presentation/widget/button_widget.dart';
import 'package:bisa_app/src/utils/resources/asset_resources.dart';
import 'package:bisa_app/src/utils/resources/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({super.key});

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
 
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
                  
                  decoration:BoxDecoration(
                    
                    image:DecorationImage(image: AssetImage(AssetResources.backgroundcard))
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "200.00",
                        style: AppTheme.buttonText
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
                height: 23.h,
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    textAlign: TextAlign.start,
                    "Choose other",
                    style: AppTheme.tabText,
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  const SubscriptionWidget(),
                  
                ],
              ),
             ButtonWidget(buttonTextContent: "Update")
            ],
          ),
        ),
      ),
    );
  }
}


