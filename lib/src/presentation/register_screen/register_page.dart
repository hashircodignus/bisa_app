import 'package:bisa_app/src/presentation/create_password_screen/create_password_page.dart';
import 'package:bisa_app/src/presentation/widget/button_widget.dart';
import 'package:bisa_app/src/presentation/widget/head_container.dart';
import 'package:bisa_app/src/presentation/widget/userid_textfield.dart';
import 'package:bisa_app/src/utils/resources/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/resources/asset_resources.dart';
import '../otp_screen/otp_page.dart';

class RegisterPage extends StatefulWidget {
   const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController loginIdController=TextEditingController();


  final _signUpKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  void _showSnackBar(String message){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text(message))
    );
  }
  void verifyPhoneNumber()async{
    showDialog(context: context, builder: (context){
      return const Center(child: CircularProgressIndicator(
        color: AppTheme.textColor,
      ));
    });
    try{await auth.verifyPhoneNumber(
          phoneNumber:"+91${loginIdController.text}",
          verificationCompleted: (PhoneAuthCredential credential){
            _showSnackBar("OTP sent");
          },
          verificationFailed: (FirebaseAuthException e){
            _showSnackBar(e.message.toString());
          },
          codeSent: (String verificationId,int? resendToken){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> OTPPage(phoneNumber: loginIdController.text,verificationId: verificationId,)));
            },

          codeAutoRetrievalTimeout: (String verificationId){}
);
     final uuid= FirebaseAuth.instance.currentUser!.uid;
     FirebaseFirestore.instance.collection('userCredential').doc(uuid).set({
       'id':uuid,
       'phoneNumber': loginIdController.text,
     });
    }on FirebaseAuthException catch (e){
      _showSnackBar(e.code);
    }
  }
  void addEmail()async{
    showDialog(context: context, builder: (context){
      return const Center(child: CircularProgressIndicator(
        color: AppTheme.textColor,
      ));
    });
    try{
      await FirebaseFirestore.instance.collection('userCredential').add({
        'email':loginIdController.text
      }).then((value) => {
      Navigator.push(context, MaterialPageRoute(builder: (context)=> CreatePasswordPage(emailId: loginIdController.text,))),
      });
    }on FirebaseAuthException catch (e){
      _showSnackBar(e.code);
    }

  }
  @override
  void dispose() {
    loginIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body:Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          color: AppTheme.backColor,
          child: SingleChildScrollView(
            child: Form(
              key: _signUpKey,
              child: Column(
                children: [
                   SizedBox(height: 240.h,),
                   Padding(
                     padding: EdgeInsets.symmetric(horizontal: 101.w),
                     child: HeadContainer(
                        headingText: "REGISTER",
                        smallTitleText: "Register your Account",image: AssetImage(AssetResources.appLogo),containerHeight: 163.h,containerWidth: 187.w,logoWidth: 133.w,logoHeight: 48.h,),
                   ),
                   SizedBox(height: 166.h,),
                  UserIdTextField(controller: loginIdController,textInputAction:TextInputAction.done,onSubmitted: (value){
                      if(_signUpKey.currentState!.validate()&&
                          loginIdController.text.contains(RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$'))
                      ){
                        verifyPhoneNumber();

                      }else if(_signUpKey.currentState!.validate()&&
                          loginIdController.text.contains(RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))
                      ){
                        addEmail();
                      }
                  },),
                   SizedBox(height: 150.h,),
                   ButtonWidget(buttonTextContent: "SUBMIT",onPressed: ()async{
                     if(_signUpKey.currentState!.validate()&&
                     loginIdController.text.contains(RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$'))
                     ){
                       verifyPhoneNumber();
                     }else if(_signUpKey.currentState!.validate()&&
                         loginIdController.text.contains(RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))
                     ){
                       addEmail();
                     }
                   },)

                ],

              ),
            ),
          ),
        ),
      ),
    );
  }
}
