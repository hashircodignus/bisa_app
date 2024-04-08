import 'package:bisa_app/src/presentation/home_screen/bottom_nav_bar.dart';
import 'package:bisa_app/src/presentation/otp_screen/cubit/otp_page_cubit.dart';
import 'package:bisa_app/src/presentation/widget/appbar_back_button_widget.dart';
import 'package:bisa_app/src/presentation/widget/button_widget.dart';
import 'package:bisa_app/src/utils/resources/asset_resources.dart';
import 'package:bisa_app/src/utils/resources/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';
import '../card_type_page/card_type_page.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({
    super.key,
  });

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(behavior: SnackBarBehavior.floating, content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    final otpBloc = BlocProvider.of<OtpPageCubit>(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme.backColor,
          automaticallyImplyLeading: false,
          title: const AppBarBackButton(),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          color: AppTheme.backColor,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 21.h,
                ),
                Lottie.asset(AssetResources.otpLottie,
                    width: 179.w, height: 179.h),
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  "Enter Your OTP",
                  style: AppTheme.headText,
                ),
                Text(
                  "OTP Will Send to Your Registerd Email or\nMobile Number",
                  style: AppTheme.smallHead,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 60.h,
                ),
                SizedBox(
                  height: 59.h,
                  width: double.infinity,
                  //color: Colors.blue,
                  child: Pinput(
                    controller: otpBloc.pinController,
                    length: 6,
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: 50.h, left: 20.w, right: 20.w),
          child: BlocListener<OtpPageCubit, OtpPageState>(
            listener: (context, state) {
              if (state is OtpPageLoading) {
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context){
                      return Center(
                        child: CircularProgressIndicator(
                          color: AppTheme.textColor,
                        ),
                      );
                    }
                );
              }
              if(state is OtpPageUserExists){
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>BottomNavBarPage()), (route) => false);
              }
              if (state is OtpPageSuccess) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CardTypePage()),
                    (route) => false);
              }
              if (state is OtpPageError) {
                _showSnackBar(state.errorText);
              }
            },
            child: ButtonWidget(
                buttonTextContent: "GO",
                onPressed: () async {
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context){
                        return Center(
                          child: CircularProgressIndicator(
                            color: AppTheme.textColor,
                          ),
                        );
                      },
                  );
                  Future.delayed(Duration(seconds: 2),(){
                    Navigator.pop(context);
                    otpBloc.otpValidate(context);
                  });
                }),
          ),
        ),
      ),
    );
  }
}
