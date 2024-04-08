import 'package:bisa_app/src/presentation/more_screen/subscription/model/subscription_model.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
part 'create_card_state.dart';

class CreateCardCubit extends Cubit<CreateCardState> {
  CreateCardCubit() : super(CreateCardInitial());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController professionController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController websiteController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController socialController = TextEditingController();

  SubscriptionPlan? selectedPlan;

  void clearCardData() {
    nameController.clear();
    professionController.clear();
    addressController.clear();
    websiteController.clear();
    phoneController.clear();
    emailController.clear();
    socialController.clear();
  }

  void updateCardData() async {
    emit(CreateCardInitial());
    emit(CreateCardLoading());

    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      Map<String, String> cardData = {
        'name': nameController.text,
        'profession': professionController.text,
        'address': addressController.text,
        'website': websiteController.text,
        'phone': phoneController.text,
        'email': emailController.text,
        'social': socialController.text,
        'subscriptionPlan': selectedPlan?.name ?? '',
        'subscriptionAmount': ' ${selectedPlan?.amount}',
        'uid': currentUser!.uid,
      };

      if (selectedPlan != null) {
        cardData['subscriptionPlan'] = selectedPlan?.name ?? '';
        cardData['subscriptionAmount'] = selectedPlan!.amount.toString();
      }
      DocumentReference cardDocRef =
          FirebaseFirestore.instance.collection('cards').doc();

      await cardDocRef.set(cardData);

      emit(CreateCardLoaded());
    } catch (e) {
      emit(CreateCardError(errorText: e.toString()));
    }
  }

  void selectPlan(SubscriptionPlan plan) {
    selectedPlan = plan;
  }
}
