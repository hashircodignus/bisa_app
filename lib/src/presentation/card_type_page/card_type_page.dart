import 'package:bisa_app/src/presentation/kyc_create_page/kyc_create_page.dart';
import 'package:bisa_app/src/presentation/widget/button_widget.dart';
import 'package:bisa_app/src/presentation/widget/light_button_widget.dart';
import 'package:bisa_app/src/utils/resources/asset_resources.dart';
import 'package:bisa_app/src/utils/resources/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widget/app_bar_title_widget.dart';

class CardTypePage extends StatefulWidget {
  const CardTypePage({super.key});

  @override
  State<CardTypePage> createState() => _CardTypePageState();
}

class _CardTypePageState extends State<CardTypePage> {
  int selectedIndex = -1;
  bool get isButtonEnabled => selectedIndex != -1;

  final List<Map<String, dynamic>> cardDataList = [
    {
      'icon': AssetResources.briefcaseIcon,
      'backgroundColor': const Color(0xffD5F7FC),
      'title': "Business",
    },
    {
      'icon': AssetResources.personIcon,
      'backgroundColor': const Color(0xffFFF2DE),
      'title': 'Individual',
    }
  ];

  @override
  void initState() {
    super.initState();
    selectedIndex = -1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const AppBarTitleWidget(
          text: 'Choose Account',
        ),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Stack(
            children: [
              ListView.builder(
                itemCount: cardDataList.length,
                itemBuilder: (context, index) {
                  final cardData = cardDataList[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(54.r),
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 14.w, vertical: 14.h),
                          height: 78.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppTheme.backColor,
                            borderRadius: BorderRadius.circular(54.r),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 50.h,
                                width: 50.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(79.r),
                                  color: cardData['backgroundColor'],
                                ),
                                child: Center(
                                    child:
                                        SvgPicture.asset(cardData['icon'])),
                              ),
                              SizedBox(width: 20.w),
                              Text(
                                cardData['title'],
                                style: AppTheme.headText,
                              ),
                              if (selectedIndex == index)
                                const Expanded(
                                    child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  ),
                                ))
                            ],
                          ),
                        )),
                  );
                },
              ),
              Align(
                alignment: const Alignment(0, -0.45),
                child: isButtonEnabled
                    ? Text(
                        "These Terms and Conditions ("
                        "Terms"
                        ") govern your use of the Index pro mobile application.",
                        style: AppTheme.smallHead,
                      )
                    : Container(),
              )
            ],
          )),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 50.h, left: 20.w, right: 20.w),
        child: isButtonEnabled
            ? ButtonWidget(
                buttonTextContent: "Confirm",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const KYCCreatePage()));
                },
              )
            : const LightButtonWidget(buttonTextContent: "Confirm"),
      ),
    );
  }
}
