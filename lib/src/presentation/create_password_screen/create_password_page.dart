import 'package:bisa_app/src/presentation/login_screen/login_page.dart';
import 'package:bisa_app/src/presentation/widget/button_widget.dart';
import 'package:bisa_app/src/presentation/widget/head_container.dart';
import 'package:bisa_app/src/presentation/widget/pasword_textfield.dart';
import 'package:bisa_app/src/utils/resources/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

import 'package:flutter_screenutil/flutter_screenutil.dart';
class CreatePasswordPage extends StatefulWidget {
  final String? phoneNumber;
  final String? emailId;
  const CreatePasswordPage({super.key,this.phoneNumber,this.emailId,});
  @override
  State<CreatePasswordPage> createState() => _CreatePasswordPageState();
}

class _CreatePasswordPageState extends State<CreatePasswordPage> {
  final TextEditingController _passController= TextEditingController();
  final TextEditingController _confirmController= TextEditingController();
  void _showSnackBar(String message){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text(message))
    );
  }
  final _passPageKey = GlobalKey<FormState>();

  void createPasswordPhone()async{
    showDialog(context: context, builder: (context){
      return const Center(child: CircularProgressIndicator(
        color: AppTheme.textColor,
      ));
    });
    try{
      FirebaseAuth.instance.signInAnonymously().then((value) => {
        FirebaseFirestore.instance.collection('users').doc(value.user!.uid).set({
          'id': value.user!.uid,
          'phoneNumber':widget.phoneNumber,
          'password': _passController.text,
        }).then((value) {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const LoginPage()), (route) => false);
          _showSnackBar("Password created");
        })
      });
       }on FirebaseException catch (e){
      _showSnackBar(e.code);
    }
    Navigator.pop(context);
  }
  void createPasswordEmail()async{
    showDialog(context: context, builder: (context){
      return const Center(child: CircularProgressIndicator(
        color: AppTheme.textColor,
      ));
    });
    try{
      log("email => ${widget.emailId}");
      FirebaseAuth.instance.createUserWithEmailAndPassword(email: widget.emailId!, password: _passController.text).then((value) {
        FirebaseFirestore.instance.collection('users').doc(value.user!.uid).set({
          'id': value.user!.uid,
          'email':widget.emailId,
          'password': _passController.text,
        }).then((value) {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const LoginPage()), (route) => false);
          _showSnackBar("Password created");
        });
      });
    }on FirebaseAuthException catch (e){
      _showSnackBar(e.code);
    }
    Navigator.pop(context);
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Container(
          padding:  EdgeInsets.symmetric(horizontal: 20.w),
          color: AppTheme.backColor,
          child: SingleChildScrollView(
            child: Form(
              key: _passPageKey,
              child: Column(
                children: [
                   SizedBox(height: 200.h,),
                     HeadContainer(headingText: "SET YOUR PASSWORD", smallTitleText: "Password will be six characters",containerHeight: 106.h,containerWidth: 247.w),
                   SizedBox(height: 163.h,),
                  PasswordTextField(passController: _passController,textInputAction: TextInputAction.next,),
                  PasswordTextField(passController: _confirmController,textInputAction: TextInputAction.done,),
                   SizedBox(height: 200.h,),
                 ButtonWidget(buttonTextContent: "GO",onPressed: (){
                   if(_passPageKey.currentState!.validate()&&
                       _confirmController.text!=_passController.text
                   ){
                     _showSnackBar("Password doesn't match");
                   }
                   else if(
                   _confirmController.text==_passController.text &&
                       widget.phoneNumber!=null
                   ){
                     createPasswordPhone();
                   }
                   else{
                     createPasswordEmail();
                   }
                 })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
