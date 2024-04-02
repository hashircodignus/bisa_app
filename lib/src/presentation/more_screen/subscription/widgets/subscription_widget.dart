import 'package:bisa_app/src/utils/resources/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubscriptionWidget extends StatefulWidget {
  const SubscriptionWidget({super.key});

  @override
  State<SubscriptionWidget> createState() => _SubscriptionWidgetState();
}

class _SubscriptionWidgetState extends State<SubscriptionWidget> {
  bool selected1 = true;
  bool selected2 = false;
  bool selected3 = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 550.h,
      //color: Colors.blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selected1 = !selected1;
                    selected2 = false;
                    selected3 = false;
                  });
                },
                child: Container(
                  height: 220.h,
                  width: 185.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(30.r),
                      color: selected1
                          ? AppTheme.cardColorlight
                          : AppTheme.backColor,
                      boxShadow: [
                        BoxShadow(
                            color: AppTheme.textColor.withOpacity(0.08),
                            blurRadius: 8,
                            spreadRadius: 1)
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("3 Month",
                          style: selected1
                              ? AppTheme.greenSubText
                              : AppTheme.labelText),
                      Text(
                        "200.00",
                        style: AppTheme.centertext,
                      ),
                      selected1
                          ? Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadiusDirectional.circular(34.r),
                                  color: AppTheme.cardColor),
                              height: 40.h,
                              width: 127.w,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Subscribed",
                                    style: AppTheme.buttonText,
                                  ),
                                  const Icon(
                                    Icons.check_circle,
                                    color: Colors.white,
                                    size: 15,
                                  )
                                ],
                              ),
                            )
                          : Container(
                              alignment: Alignment.center,
                              height: 40.h,
                              width: 127.w,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadiusDirectional.circular(34.r),
                                color: AppTheme.textColor,
                              ),
                              child: Text(
                                "Subscribe",
                                style: AppTheme.buttonText,
                              ),
                            )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selected1 = false;
                    selected2 = !selected2;
                    selected3 = false;
                  });
                },
                child: Container(
                  height: 220.h,
                  width: 185.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(30.r),
                      color: selected2
                          ? AppTheme.cardColorlight
                          : AppTheme.backColor,
                      boxShadow: [
                        BoxShadow(
                            color: AppTheme.textColor.withOpacity(0.08),
                            blurRadius: 8,
                            spreadRadius: 1)
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "6 Month",
                        style: selected2
                            ? AppTheme.greenSubText
                            : AppTheme.labelText,
                      ),
                      Text(
                        "300.00",
                        style: AppTheme.centertext,
                      ),
                      selected2
                          ? Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadiusDirectional.circular(34.r),
                                  color: AppTheme.cardColor),
                              height: 40.h,
                              width: 127.w,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Subscribed",
                                    style: AppTheme.buttonText,
                                  ),
                                  const Icon(
                                    Icons.check_circle,
                                    color: Colors.white,
                                    size: 15,
                                  )
                                ],
                              ),
                            )
                          : Container(
                              alignment: Alignment.center,
                              height: 40.h,
                              width: 127.w,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadiusDirectional.circular(34.r),
                                color: AppTheme.textColor,
                              ),
                              child: Text(
                                "Subscribe",
                                style: AppTheme.buttonText,
                              ),
                            )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                selected1 = false;
                selected2 = false;
                selected3 = !selected3;
              });
            },
            child: Container(
              height: 220.h,
              width: 185.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(30.r),
                  color: selected3
                      ? AppTheme.cardColorlight
                      : AppTheme.backColor,
                  boxShadow: [
                    BoxShadow(
                        color: AppTheme.textColor.withOpacity(0.08),
                        blurRadius: 8,
                        spreadRadius: 1)
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "1 Year",
                    style: selected3
                        ? AppTheme.greenSubText
                        : AppTheme.labelText,
                  ),
                  Text(
                    "1000.00",
                    style: AppTheme.centertext,
                  ),
                  selected3
                      ? Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadiusDirectional.circular(34.r),
                              color: AppTheme.cardColor),
                          height: 40.h,
                          width: 127.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Subscribed",
                                style: AppTheme.buttonText,
                              ),
                              const Icon(
                                Icons.check_circle,
                                color: Colors.white,
                                size: 15,
                              )
                            ],
                          ),
                        )
                      : Container(
                          alignment: Alignment.center,
                          height: 40.h,
                          width: 127.w,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadiusDirectional.circular(34.r),
                            color: AppTheme.textColor,
                          ),
                          child: Text(
                            "Subscribe",
                            style: AppTheme.buttonText,
                          ),
                        )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
