import 'package:bisa_app/src/presentation/widget/appbar_back_button_widget.dart';
import 'package:bisa_app/src/presentation/widget/button_widget.dart';
import 'package:bisa_app/src/utils/resources/asset_resources.dart';
import 'package:bisa_app/src/utils/resources/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';

import '../card_type_page/card_type_page.dart';

class OTPPage extends StatefulWidget {
  final String? phoneNumber;
  //final String verificationId;
  const OTPPage({super.key, this.phoneNumber,
  //  required this.verificationId
  });

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  final TextEditingController _pinController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
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
                Container(
                  height: 59.h,
                  width: double.infinity,
                  //color: Colors.blue,
                  child: Pinput(
                    controller: _pinController,
                    length: 6,
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: 50.h, left: 20.w, right: 20.w),
          child: ButtonWidget(
              buttonTextContent: "GO",
              onPressed: () async {
                // showDialog(context: context, builder: (context){
                //   return const Center(child: CircularProgressIndicator(
                //     color: AppTheme.textColor,
                //   ));
                // });
                // PhoneAuthCredential credential = PhoneAuthProvider.credential(
                //     verificationId: widget.verificationId,
                //     smsCode: _pinController.text);
                // await FirebaseFirestore.instance.collection('users').add(
                //     {
                //       'phoneNumber':widget.phoneNumber
                //     });
                // await auth.signInWithCredential(credential).then((value) {
                //   Navigator.push(context, MaterialPageRoute(builder: (
                //       context) =>  const CardTypePage()));
                // });

                Navigator.push(context, MaterialPageRoute(builder: (context)=>const CardTypePage()));
              }),
        ),
      ),
    ); 
  }
}
