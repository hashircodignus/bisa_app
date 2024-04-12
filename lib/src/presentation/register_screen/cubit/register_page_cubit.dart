import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../select_country_screen/cubit/selected_country_cubit.dart';

part 'register_page_state.dart';

class RegisterPageCubit extends Cubit<RegisterPageState> {
  RegisterPageCubit() : super(RegisterPageInitial());
  final uuid = '';
  TextEditingController loginIdController = TextEditingController();
  late String VerificationId = '';
  late String phoneNumber = '';

  register(BuildContext context) async {
    void _showSnackBar(String message) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating, content: Text(message)));
    }

    FirebaseAuth auth = FirebaseAuth.instance;
    final countryBloc = BlocProvider.of<SelectedCountryCubit>(context);
    emit(RegisterPageInitial());
    emit(RegisterPageLoading());
    try {
      phoneNumber= "+${countryBloc.countryPhoneCode + loginIdController.text}";
      log("phone number = ${phoneNumber}");
      await auth
          .verifyPhoneNumber(
              phoneNumber:
                  "${phoneNumber}",
              verificationCompleted: (PhoneAuthCredential credential) {
                emit(RegisterPageOtpVerification(
                    verificationSend: "Verification completed"));
              },
              verificationFailed: (FirebaseAuthException e) {
                emit(RegisterPageError(errorText: "Mobile number is not valid"));
                throw (e);
              },
              codeSent: (String verificationId, int? resendToken) {
                emit(RegisterPageCodeSent(codeSend: "OTP sent"));
                VerificationId = verificationId;
              },
              codeAutoRetrievalTimeout: (String verificationId) {})
          .whenComplete(
              () => emit(RegisterPageSuccess(successText: "Login Successful")));

      // FirebaseFirestore.instance.collection('userCredential').doc(uuid).set({
      //   'id':uuid,
      //   'phone number':loginIdController.toString(),
      // });
    } catch (e) {
      log(e.toString());
      emit(RegisterPageError(errorText: "Login Failed"));
    }
  }
}
