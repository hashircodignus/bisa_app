import 'dart:developer';
import 'package:bisa_app/src/presentation/forgot_password_screen/forgot_password_page.dart';
import 'package:bisa_app/src/presentation/home_screen/bottom_nav_bar.dart';
import 'package:bisa_app/src/presentation/register_screen/register_page.dart';
import 'package:bisa_app/src/presentation/widget/pasword_textfield.dart';
import 'package:bisa_app/src/presentation/widget/userid_textfield.dart';
import 'package:bisa_app/src/utils/resources/asset_resources.dart';
import 'package:bisa_app/src/utils/resources/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widget/button_widget.dart';
import '../widget/head_container.dart';

class LoginPage extends StatefulWidget {
  final String? phoneNumber;
  final String? emailId;
 const LoginPage({super.key,this.emailId,this.phoneNumber});
  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  final TextEditingController _loginIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _loginKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void signUserInPhone() async{
    showDialog(context: context, builder: (context){
      return const Center(child: CircularProgressIndicator(
        color: AppTheme.textColor,
      ));
    });
    try{
      await _auth.signInAnonymously();
      final userSnapshot = await FirebaseFirestore.instance.collection('users').where('phoneNumber',isEqualTo: _loginIdController.text.trim()).where('password',isEqualTo: _passwordController.text.trim()).get();
      if(userSnapshot.docs.isNotEmpty){
        Future.delayed(const Duration(seconds: 2),(){
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const BottomNavBarPage()), (route) => false);
        });
        log("error: $Error");
        _showSnackBar("Login Successful");
        Navigator.pop(context);
      }else{
        _showSnackBar("No user found");
      }
    }on FirebaseAuthException catch (e){
      if(e.code == 'wrong-password'){
        _showSnackBar(e.code);
      }
    }catch (e){
      log(e.toString());
      _showSnackBar("Failed to login");
    }
  }

  void signUserInEmail() async{
    showDialog(context: context, builder: (context){
      return const Center(child: CircularProgressIndicator(
        color: AppTheme.textColor,
      ));
    });
    try{
     final userSnapshot = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _loginIdController.text,
         password: _passwordController.text).then((user) =>
     FirebaseFirestore.instance.collection('users').doc(user.user!.uid).get());
    if(userSnapshot.data()!.isNotEmpty){ if(mounted) {
      _showSnackBar("Login successful");}
      Future.delayed(const Duration(seconds: 1),(){
        // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const BottomNavBarPage()), (route) => false);
      });
    }else{
      if(mounted) {
      _showSnackBar("No user found");}
    }
    }on FirebaseAuthException catch (e){
      if(mounted) {
        _showSnackBar(e.code);}
    }catch (e){
      log("Error: $Error");
      if(mounted) {
        _showSnackBar("Failed to login");
      }    }
    Navigator.pop(context);
  }
  void _showSnackBar(String message){
    if(mounted){
    ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
           behavior: SnackBarBehavior.floating,
           content: Text(message))
    );}
  }
  @override
  void dispose() {
   _loginIdController.dispose();
   _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Container(
         padding: EdgeInsets.symmetric(horizontal: 20.w),
         // color: Colors.red,
          child:   SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 210.h,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 111.w),
                  child:  HeadContainer(
                    headingText: 'LOGIN',
                    smallTitleText: 'Login to your Account', image: const AssetImage(AssetResources.appLogo),containerHeight: 163.h,containerWidth: 167.w,logoHeight: 48.h,logoWidth: 133.w,),
                ),
                SizedBox(height: 100.h,),
                Form(
                  key: _loginKey,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      UserIdTextField(controller: _loginIdController,textInputAction: TextInputAction.next,),
                      PasswordTextField(textInputAction: TextInputAction.done, passController: _passwordController,onSubmitted: (value) async{
                        if(_loginKey.currentState!.validate() &&
                            _loginIdController.text.isNotEmpty &&
                            _passwordController.text.length>5 &&
                            _loginIdController.text.contains(RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$'))
                        ){
                          signUserInPhone();
                        }else{
                          signUserInEmail();
                        }
                      },),
                      InkWell(
                          onTap:()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>const ForgotPasswordPage())),
                          child: Text("Forgot Password?",style: AppTheme.smallHead,)),
                      SizedBox(height: 95.h,),
                       ButtonWidget(buttonTextContent: 'START',onPressed:() async{
                         if(_loginKey.currentState!.validate() &&
                             _loginIdController.text.isNotEmpty &&
                             _passwordController.text.length>5 &&
                             _loginIdController.text.contains(RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$'))
                         ){
                           signUserInPhone();
                         }else{
                           signUserInEmail();
                         }
                       } ,),
                      SizedBox(height: 35.h,),
                      InkWell(
                        onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const RegisterPage())),
                        child: Container(
                          decoration: const BoxDecoration(
                            //color: Colors.red
                          ),
                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RichText(text: TextSpan(
                                text: "You don't have an Account? ",style: AppTheme.smallHead,
                                children: [
                                  TextSpan(
                                    text: "Register",style: AppTheme.fieldText
                                  )
                                ]
                              )),
                            ],
                          ),

                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
      )
    );
  }
}