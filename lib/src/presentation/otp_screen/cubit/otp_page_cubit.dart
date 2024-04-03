import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../register_screen/cubit/register_page_cubit.dart';
import '../../select_country_screen/cubit/selected_country_cubit.dart';
part 'otp_page_state.dart';

class OtpPageCubit extends Cubit<OtpPageState> {
  OtpPageCubit() : super(OtpPageInitial());

  final TextEditingController pinController = TextEditingController();

  otpValidate(BuildContext context) async{
    emit(OtpPageInitial());
    emit(OtpPageLoading());
  try{
    FirebaseAuth auth = FirebaseAuth.instance;
    final registerBloc = BlocProvider.of<RegisterPageCubit>(context);
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: registerBloc.VerificationId,
        smsCode: pinController.text);
    await FirebaseFirestore.instance.collection('users').doc(auth.currentUser?.uid).set(
        {  'id': auth.currentUser?.uid,
          'phoneNumber':"+${BlocProvider.of<SelectedCountryCubit>(context).countryPhoneCode+BlocProvider.of<RegisterPageCubit>(context).loginIdController.text}"
        });
    await auth.signInWithCredential(credential).then((value) {
      emit(OtpPageSuccess(successText: "Login Successful"));
    });
  }
  catch (e){
    emit(OtpPageError(errorText: e.toString()));
  }
}
}