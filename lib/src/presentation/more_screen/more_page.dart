import 'package:bisa_app/src/presentation/home_screen/bottom_nav_bar.dart';
import 'package:bisa_app/src/presentation/home_screen/widget/menu_text_button_widget.dart';
import 'package:bisa_app/src/presentation/more_screen/create_card_screen/my_card_page.dart';
import 'package:bisa_app/src/presentation/more_screen/subscription/subscription.dart';
import 'package:bisa_app/src/presentation/select_country_screen/view/select_country_page.dart';
import 'package:bisa_app/src/utils/resources/asset_resources.dart';
import 'package:bisa_app/src/utils/resources/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  void signUserOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 20.w, right: 20.w),
        height: double.infinity,
        color: AppTheme.textColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 150.h,
                decoration: BoxDecoration(
                    // color: Colors.blue,
                    border: Border(
                        bottom:
                            BorderSide(color: AppTheme.smallText, width: 1.w)),
                    image: const DecorationImage(
                        image: AssetImage(AssetResources.appLogoWhiteLarge),
                        alignment: Alignment(0, 0.6))),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close,
                    color: AppTheme.smallText,
                  ),
                  alignment: const Alignment(1, 0.5),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              MenuTextButtonWidget(
                buttonText: 'Home',
                buttonImage: const AssetImage(AssetResources.homeIcon),
                onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BottomNavBarPage())),
              ),
              SizedBox(
                height: 30.h,
              ),
              MenuTextButtonWidget(
                buttonText: 'My Card',
                buttonImage: const AssetImage(AssetResources.myCard),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyCardPage())),
              ),
              SizedBox(
                height: 30.h,
              ),
              MenuTextButtonWidget(
                buttonText: 'Subscription',
                buttonImage: const AssetImage(AssetResources.subscription),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SubscriptionPage())),
              ),
              SizedBox(
                height: 30.h,
              ),
              const MenuTextButtonWidget(
                  buttonText: 'About Us',
                  buttonImage: AssetImage(AssetResources.aboutUs)),
              SizedBox(
                height: 30.h,
              ),
              const MenuTextButtonWidget(
                  buttonText: 'How To Use',
                  buttonImage: AssetImage(AssetResources.howToUse)),
              SizedBox(
                height: 30.h,
              ),
              const MenuTextButtonWidget(
                  buttonText: 'Invite Friends',
                  buttonImage: AssetImage(AssetResources.inviteFriends)),
              SizedBox(
                height: 30.h,
              ),
              const MenuTextButtonWidget(
                  buttonText: 'Settings',
                  buttonImage: AssetImage(AssetResources.settingsIcon)),
              SizedBox(
                height: 30.h,
              ),
              const MenuTextButtonWidget(
                  buttonText: 'Feedback',
                  buttonImage: AssetImage(AssetResources.feedbackIcon)),
              SizedBox(
                height: 30.h,
              ),
              const MenuTextButtonWidget(
                  buttonText: 'Partner With Us',
                  buttonImage: AssetImage(AssetResources.partnerWithUs)),
              SizedBox(
                height: 30.h,
              ),
              MenuTextButtonWidget(
                buttonText: 'Logout',
                buttonImage: const AssetImage(AssetResources.logOut),
                onTap: ()
              {
                signUserOut();
              }
              ),
              SizedBox(
                height: 30.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
