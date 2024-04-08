import 'dart:developer';

import 'package:bisa_app/src/presentation/more_screen/subscription/model/subscription_model.dart';
import 'package:bisa_app/src/utils/resources/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../create_card_screen/create_card_page/cubit/create_card_cubit.dart';

class SubscriptionWidget extends StatefulWidget {
  const SubscriptionWidget({super.key,});

  @override
  State<SubscriptionWidget> createState() => _SubscriptionWidgetState();
}

class _SubscriptionWidgetState extends State<SubscriptionWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final cardBloc = BlocProvider.of<CreateCardCubit>(context);

    return StreamBuilder<QuerySnapshot>(
        stream:
            FirebaseFirestore.instance.collection('subscription').snapshots(),
        builder: (context, snapshot) {
          if(snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (snapshot.data == null) {
            return Center(child: CircularProgressIndicator(
              color: AppTheme.textColor,
            )); // Or any loading indicator
          }
          final subscriptionPlans = snapshot.data!.docs
              .map((doc) =>
                  SubscriptionPlan.fromMap(doc.data() as Map<String, dynamic>))
              .toList();

          return Container(
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20.h,
                crossAxisSpacing: 20.w,
                childAspectRatio: 0.8,
              ),
              itemCount: subscriptionPlans.length,
              itemBuilder: (context, index) {
                subscriptionPlans.sort((a,b)=> a.amount!.compareTo(b.amount ??0));
                final plan = subscriptionPlans[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                      // cardBloc.selectedPlan.add(subscriptionPlans[index]);
                      cardBloc.selectPlan(plan);
                      log("name1: ${subscriptionPlans[index].name}");
                      log("name2: ${cardBloc.selectedPlan?.name}");

                    });
                  },
                  child: Container(
                    height: 220.h,
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r),
                        color: index == selectedIndex
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
                          plan.name ?? "",
                          style: index == selectedIndex
                              ? AppTheme.greenSubText
                              : AppTheme.labelText,
                        ),
                        Text(
                          "${plan.amount}",
                          style: AppTheme.centertext,
                        ),
                        index == selectedIndex
                            ? Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(34.r),
                                  color: AppTheme.cardColor,
                                ),
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
                                    Icon(
                                      Icons.check_circle,
                                      color: AppTheme.backColor,
                                      size: 15.sp,
                                    ),
                                  ],
                                ),
                              )
                            : Container(
                                alignment: Alignment.center,
                                height: 40.h,
                                width: 127.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(34.r),
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
                );
              },
            ),
          );
        });
  }
}
