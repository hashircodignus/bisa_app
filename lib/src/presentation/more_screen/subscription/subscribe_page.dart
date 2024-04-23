import 'dart:developer';
import 'package:bisa_app/src/presentation/more_screen/create_card_screen/create_card_page/cubit/create_card_cubit.dart';
import 'package:bisa_app/src/presentation/more_screen/subscription/widgets/subscription_widget.dart';
import 'package:bisa_app/src/presentation/widget/app_bar_title_widget.dart';
import 'package:bisa_app/src/presentation/widget/button_widget.dart';
import 'package:bisa_app/src/presentation/widget/success_screen.dart';
import 'package:bisa_app/src/utils/resources/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubscribePage extends StatelessWidget {
  const SubscribePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cardBloc = BlocProvider.of<CreateCardCubit>(context);
    void _showSnackBar(String message) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating, content: Text(message)));
    }

    return Scaffold(
      backgroundColor: AppTheme.backColor,
      appBar: AppBar(
        backgroundColor: AppTheme.backColor,
        automaticallyImplyLeading: false,
        title: const AppBarTitleWidget(text: "Subscribe"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: SubscriptionWidget(onPlanSelected: (SubscriptionPlan ) {  },),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 50.h, left: 20.w, right: 20.w),
        child: BlocListener<CreateCardCubit, CreateCardState>(
          listener: (context, state) {
            if (state is CreateCardLoading) {
              const Center(
                child: CircularProgressIndicator(
                  color: AppTheme.textColor,
                ),
              );
            }
            if (state is CreateCardCreated) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const SuccessPage()),
                  (route) => false);
            }
            if (state is CreateCardError) {
              _showSnackBar(state.errorText);
            }
          },
          child: ButtonWidget(
            buttonTextContent: "Payment",
            onPressed: () async {
              log("name : ${cardBloc.selectedPlan?.name}");
              if (cardBloc.selectedPlan != null) {
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: AppTheme.textColor,
                        ),
                      );
                    });
                  await cardBloc.CreateCard();
              } else {
                _showSnackBar("Please select a subscription plan.");
              }
            },
          ),
        ),
      ),
    );
  }
}
