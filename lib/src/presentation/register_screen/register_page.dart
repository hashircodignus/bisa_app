import 'package:bisa_app/src/presentation/home_screen/bottom_nav_bar.dart';
import 'package:bisa_app/src/presentation/home_screen/home_page.dart';
import 'package:bisa_app/src/presentation/widget/button_widget.dart';
import 'package:bisa_app/src/presentation/widget/userid_textfield.dart';
import 'package:bisa_app/src/utils/resources/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/resources/asset_resources.dart';
import '../otp_screen/otp_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  final String flag;
  final String countryphoneCode;
  const RegisterPage(
      {super.key, required this.flag, required this.countryphoneCode});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController loginIdController = TextEditingController();

  final _signUpKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  
 

 

  @override
  void dispose() {
    loginIdController.dispose();
    super.dispose();
  }
  // void verifyPhoneNumber() async {
  //   showDialog(
  //       context: context,
  //       builder: (context) {
  //         return const Center(
  //             child: CircularProgressIndicator(
  //           color: AppTheme.textColor,
  //         ));
  //       });
  //   try {
  //     await auth.verifyPhoneNumber(
  //         phoneNumber: "+91${loginIdController.text}",
  //         verificationCompleted: (PhoneAuthCredential credential) {
  //           _showSnackBar("OTP sent");
  //         },
  //         verificationFailed: (FirebaseAuthException e) {
  //           _showSnackBar(e.message.toString());
  //         },
  //         codeSent: (String verificationId, int? resendToken) {
  //           Navigator.push(
  //               context,
  //               MaterialPageRoute(
  //                   builder: (context) => OTPPage(
  //                         phoneNumber: loginIdController.text,
  //                         verificationId: verificationId,
  //                       )));
  //         },
  //         codeAutoRetrievalTimeout: (String verificationId) {});
  //     final uuid = FirebaseAuth.instance.currentUser!.uid;
  //     FirebaseFirestore.instance.collection('userCredential').doc(uuid).set({
  //       'id': uuid,
  //       'phoneNumber': loginIdController.text,
  //     });
  //   } on FirebaseAuthException catch (e) {
  //     _showSnackBar(e.code);
  //   }
  // }

  // void addEmail() async {
  //   showDialog(
  //       context: context,
  //       builder: (context) {
  //         return const Center(
  //             child: CircularProgressIndicator(
  //           color: AppTheme.textColor,
  //         ));
  //       });
  //   try {
  //     await FirebaseFirestore.instance
  //         .collection('userCredential')
  //         .add({'email': loginIdController.text}).then((value) => {
  //               Navigator.push(
  //                   context,
  //                   MaterialPageRoute(
  //                       builder: (context) => CreatePasswordPage(
  //                             emailId: loginIdController.text,
  //                           ))),
  //             });
  //   } on FirebaseAuthException catch (e) {
  //     _showSnackBar(e.code);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppTheme.backColor,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          color: AppTheme.backColor,
          child: SingleChildScrollView(
            child: Form(
              key: _signUpKey,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 142.h),
                    width: double.infinity,
                    child: Image(
                      image: const AssetImage(AssetResources.appLogo),
                      height: 39.h,
                      width: 105.w,
                    ),
                  ),
                  SizedBox(
                    height: 100.h,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text(
                          "Enter your mobile number",
                          style: AppTheme.headText,
                        ),
                        Text(
                          "Please confirm your country code and enter your mobile number",
                          style: AppTheme.smallHead,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  UserIdTextField(
                      controller: loginIdController,
                      textInputAction: TextInputAction.done,
                      flag: widget.flag,
                      countryphoneCode: widget.countryphoneCode
                      // onSubmitted: (value) {
                      //   if (_signUpKey.currentState!.validate() &&
                      //       loginIdController.text.contains(RegExp(
                      //           r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$'))) {
                      //     verifyPhoneNumber();
                      //   // } else if (_signUpKey.currentState!.validate() &&
                      //   //     loginIdController.text.contains(RegExp(
                      //   //         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))) {
                      //   //   addEmail();
                      //   }
                      // },
                      ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: 50.h, left: 20.w, right: 20.w),
          child: ButtonWidget(
            buttonTextContent: "GET START",
            onPressed: () async {
              // if (_signUpKey.currentState!.validate() &&
              //     loginIdController.text.contains(RegExp(
              //         r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$'))) {
              //   verifyPhoneNumber();

              if (_signUpKey.currentState!.validate()) {
               
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const OTPPage()));
              }

              //Navigator.push(context,
              //MaterialPageRoute(builder: (context) => const OTPPage()));

              // } else if (_signUpKey.currentState!.validate() &&
              //     loginIdController.text.contains(RegExp(
              //         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))) {
              //   addEmail();
            },
          ),
        ),
      ),
    );
  }
}
