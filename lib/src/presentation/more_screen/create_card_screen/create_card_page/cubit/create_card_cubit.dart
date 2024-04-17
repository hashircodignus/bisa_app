import 'dart:developer';
import 'dart:io';
import 'package:bisa_app/src/presentation/more_screen/subscription/model/subscription_model.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
part 'create_card_state.dart';

class CreateCardCubit extends Cubit<CreateCardState> {
  CreateCardCubit() : super(CreateCardInitial());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController professionController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController websiteController = TextEditingController();
  List<TextEditingController> listController = [TextEditingController()];
  List<TextEditingController> listControllerEmail = [TextEditingController()];
  List<TextEditingController> listControllerSocialMedia = [TextEditingController()];
  SubscriptionPlan? selectedPlan;
  File? image;


  void clearCardData() {
    nameController.clear();
    professionController.clear();
    addressController.clear();
    websiteController.clear();
    listController.clear();
    listControllerEmail.clear();
    listControllerSocialMedia.clear();
  }

   updateCardData() async {
    emit(CreateCardInitial());
    emit(CreateCardLoading());

    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if(currentUser == null){
        throw Exception('User not logged in');
      }
      if(nameController.text.isEmpty || professionController.text.isEmpty || addressController.text.isEmpty){
        throw Exception('Name, Profession, and Address are required fields');
      }
      log(nameController.text);
      log(professionController.text);
      log(addressController.text);
      log(websiteController.text);

      String fileName = 'user_${currentUser.uid}_${DateTime.now().millisecondsSinceEpoch}.jpg';
      Reference ref = FirebaseStorage.instance.ref('images/$fileName');
      await ref.putFile(image!);

      String imageUrl = await ref.getDownloadURL();

      Map<String, String> cardData = {
        'name': nameController.text,
        'profession': professionController.text,
        'address': addressController.text,
        'website': websiteController.text,
        'phone': listController.toString(),
        'email': listControllerEmail.toString(),
        'social': listControllerSocialMedia.toString(),
        'subscriptionPlan': selectedPlan?.name ?? '',
        'subscriptionAmount': ' ${selectedPlan?.amount}',
        'uid': currentUser.uid,
        'imageUrl' : imageUrl,
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
  

  //   uploadImage()async {
  //   emit(CreateCardLoading());
  //
  //   try{
  //     final currentUser = FirebaseAuth.instance.currentUser;
  //     if(currentUser == null){
  //       throw Exception('User not logged in');
  //     }
  //
  //     String fileName = 'user_${currentUser.uid}_${DateTime.now().millisecondsSinceEpoch}.jpg';
  //     Reference ref = FirebaseStorage.instance.ref('images/$fileName');
  //     await ref.putFile(image!);
  //
  //     String imageUrl = await ref.getDownloadURL();
  //
  //    DocumentReference cardDocRef = FirebaseFirestore.instance.collection('cards').doc();
  //    await cardDocRef.set({
  //      'imageUrl': imageUrl
  //    },SetOptions(merge:  true));
  //     emit(CreateCardLoaded());
  //   } catch (e) {
  //     emit(CreateCardError(errorText: e.toString()));
  //   }
  // }

}
