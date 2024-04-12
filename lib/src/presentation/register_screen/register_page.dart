import 'dart:developer';
import 'package:bisa_app/src/presentation/register_screen/cubit/register_page_cubit.dart';
import 'package:bisa_app/src/presentation/widget/button_widget.dart';
import 'package:bisa_app/src/presentation/widget/userid_textfield.dart';
import 'package:bisa_app/src/utils/resources/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../utils/resources/asset_resources.dart';
import '../otp_screen/otp_page.dart';
import '../select_country_screen/cubit/selected_country_cubit.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({
    super.key,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}
class _RegisterPageState extends State<RegisterPage> {
  final _signUpKey = GlobalKey<FormState>();
  
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(behavior: SnackBarBehavior.floating, content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<SelectedCountryCubit>(context);
    final registerBloc = BlocProvider.of<RegisterPageCubit>(context);
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
                  Column(
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
                  SizedBox(
                    height: 60.h,
                  ),
                  UserIdTextField(
                    controller: registerBloc.loginIdController,
                    textInputAction: TextInputAction.done,
                    flag: bloc.getFlagEmoji(),
                    countryphoneCode: bloc.countryPhoneCode,
                    
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: 50.h, left: 20.w, right: 20.w),
          child: BlocConsumer<RegisterPageCubit, RegisterPageState>(
            listener: (context, state) {
              log("register state =>$state");
              if (state is RegisterPageLoading) {
                const Center(
                  child: CircularProgressIndicator(
                    color: AppTheme.textColor,
                  ),
                );
              }
              if (state is RegisterPageSuccess) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const OTPPage()));
              } else if (state is RegisterPageOtpVerification) {
                const Center(
                  child: CircularProgressIndicator(
                    color: AppTheme.textColor,
                  ),
                );
                _showSnackBar(state.verificationSend);
              } else if (state is RegisterPageCodeSent) {
                _showSnackBar(state.codeSend);
              } else if (state is RegisterPageError) {
                _showSnackBar(state.errorText);
              }
            },
            builder: (context, state) {
              log("state is ${state.toString()}");
              if (state is RegisterPageLoading) {
                return ButtonWidget(
                    buttonTextContent: '',
                    isLoading: true,
                    onPressed: () async {});
              }
              return ButtonWidget(
                  buttonTextContent: "GET START",
                  onPressed: () async {
                    if (_signUpKey.currentState!.validate() &&
                        registerBloc.loginIdController.text.contains(RegExp(
                            r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$'))) {
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
                        registerBloc.register(context);
                      });
                    }
                  });
            },
          ),
        ),
      ),
    );
  }
}
