import 'dart:io';
import 'package:bisa_app/src/presentation/more_screen/create_card_screen/model/card_model.dart';
import 'package:bisa_app/src/presentation/more_screen/create_card_screen/model/saved_model.dart';
import 'package:bisa_app/src/presentation/more_screen/subscription/model/subscription_model.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
part 'create_card_state.dart';

class CreateCardCubit extends Cubit<CreateCardState> {
  CreateCardCubit() : super(CreateCardInitial());

  final CollectionReference cardCollection =
      FirebaseFirestore.instance.collection('cards');

  final CollectionReference savedCardCollection =
  FirebaseFirestore.instance.collection('saved');

  final TextEditingController nameController = TextEditingController();
  final TextEditingController professionController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController websiteController = TextEditingController();
  List<TextEditingController> listControllerPhone = [TextEditingController()];
  List<TextEditingController> listControllerEmail = [TextEditingController()];
  List<TextEditingController> listControllerSocialMedia = [
    TextEditingController()
  ];
  List<AssetImage?> selectedImages = [null];

  SubscriptionPlan? selectedPlan;
  File? image;
  var uuid = Uuid();

  void clearCardData() {
    nameController.clear();
    professionController.clear();
    addressController.clear();
    websiteController.clear();
    listControllerPhone.clear();
    listControllerEmail.clear();
    listControllerSocialMedia.clear();
  }

  CreateCard() async {
    emit(CreateCardInitial());
    emit(CreateCardLoading());

    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        throw Exception('User not logged in');
      }
      if (nameController.text.isEmpty ||
          professionController.text.isEmpty ||
          addressController.text.isEmpty) {
        throw Exception('Name, Profession, and Address are required fields');
      }

      String fileName =
          'user_${currentUser.uid}_${DateTime.now().millisecondsSinceEpoch}.jpg';
      Reference ref = FirebaseStorage.instance.ref('images/$fileName');
      await ref.putFile(image!);

      String imageUrl = await ref.getDownloadURL();

      List<String> phoneValues = [];
      List<String> emailValues = [];
      List<String> socialValues = [];

      List<String?> socialMediaIcons = [];
      for(AssetImage? icon in selectedImages) {
        socialMediaIcons.add(icon != null ? icon.assetName : null);
      }

      for (int i = 0; i < listControllerPhone.length; i++) {
        String phoneValue = listControllerPhone[i].text.toString();
        phoneValues.add(phoneValue);
      }

      for (int j = 0; j < listControllerEmail.length; j++) {
        String emailValue = listControllerEmail[j].text.toString();
        emailValues.add(emailValue);
      }

      for (int k = 0; k < listControllerSocialMedia.length; k++) {
        String socialValue = listControllerSocialMedia[k].text.toString();
        socialValues.add(socialValue);
      }

      String cardId = uuid.v4();

      Map<String, dynamic> data = {
        'name': nameController.text,
        'profession': professionController.text,
        'address': addressController.text,
        'website': websiteController.text,
        'socialMediaIcons': socialMediaIcons,
        'phone': phoneValues,
        'email': emailValues,
        'social': socialValues,
        'subscriptionPlan': selectedPlan?.name ?? '',
        'subscriptionAmount': ' ${selectedPlan?.amount}',
        'uid': currentUser.uid,
        'imageUrl': imageUrl,
        'cardId': cardId,
      };

      DocumentReference cardDocRef =
          FirebaseFirestore.instance.collection('cards').doc();

      await cardDocRef.set(data);
      emit(CreateCardCreated());
    } catch (e) {
      emit(CreateCardError(errorText: e.toString()));
    }
  }

  void getCards() async {
    emit(CreateCardInitial());
    emit(CreateCardLoading());
    try {
      final cardList = cardCollection.snapshots().map((snapshot) {
        return snapshot.docs.map((doc) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          return CardModel(
              address: data['address'],
              cardId: data['cardId'],
              email: data['email'],
              imageUrl: data['imageUrl'],
              name: data['name'],
              phone: data['phone'],
              profession: data['profession'],
              social: data['social'],
              subscriptionAmount: data['subscriptionAmount'],
              subscriptionPlan: data['subscriptionPlan'],
              uid: data['uid'],
              website: data['website'],
              socialMediaIcons: data['socialMediaIcons']);
        }).toList();
      });

      cardList.listen((list) {
        emit(CreateCardLoaded(cardModel: list));
      });
    } catch (e) {
      emit(CreateCardError(errorText: e.toString()));
    }
    // final snapshot = await FirebaseFirestore.instance.collection('cards').get();
    // return snapshot.docs.map((doc) => CardModel.fromJson(doc.data())).toList();
  }
  void getSavedCards() async{
    emit(CreateCardInitial());
    emit(CreateCardLoading());
    try{
      final savedCardList = savedCardCollection.where('savedBy',isEqualTo: FirebaseAuth.instance.currentUser!.uid).snapshots().map((snapshot) {
        return snapshot.docs.map((doc){
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          return SavedCardModel(
              address: data['address'],
              cardId: data['cardId'],
              email: data['email'],
              imageUrl: data['imageUrl'],
              name: data['name'],
              phone: data['phone'],
              profession: data['profession'],
              savedBy: data['savedBy'],
              social: data['social'],
              subscriptionAmount: data['subscriptionAmount'],
              subscriptionPlan: data['subscriptionPlan'],
              uid: data['uid'],
              website: data['website'], socialMediaIcons: data['socialMediaIcons']);
        }).toList();
      });

      savedCardList.listen((list) {
        emit(CreateCardSuccess(savedCardModel: list));
      });
    }catch (e) {
      emit(CreateCardError(errorText: e.toString()));
    }
  }

  Future<void> saveCard(Map<String, dynamic> cardData) async {
    final String cardId = cardData['cardId'];
    final isSaved = await isCardSaved(cardId);
    if (isSaved) {
      emit(CreateCardSavedAlready(isSavedText: 'Card has already saved!'));
      return;
    }
    try {
      cardData['savedBy'] = FirebaseAuth.instance.currentUser!.uid;
      await FirebaseFirestore.instance.collection('saved').add(cardData);
      emit(CreateCardSaved());
    } catch (e) {
      emit(CreateCardError(errorText: e.toString()));
    }
  }

  Future<bool> isCardSaved(String cardId) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return false;
    }

    final savedCardsRef = FirebaseFirestore.instance.collection('saved');
    final savedCardSnapshot = await savedCardsRef
        .where('cardId', isEqualTo: cardId)
        .where('savedBy', isEqualTo: user.uid)
        .get();

    return savedCardSnapshot.docs.isNotEmpty;
  }

  Future<void> uploadImage(File imageFile) async {
    emit(CreateCardLoading());

    try {
      String fileName = 'user_${uuid.v4()}.jpg';

      Reference ref = FirebaseStorage.instance.ref().child('images/$fileName');

      await ref.putFile(imageFile);

      String imageUrl = await ref.getDownloadURL();

      AssetImage uploadedImage = AssetImage(imageUrl);

      emit(CreateCardImageUploaded(assetImage: uploadedImage));
    } catch (e) {
      emit(CreateCardError(errorText: e.toString()));
    }
  }

  void selectPlan(SubscriptionPlan plan) {
    selectedPlan = plan;
  }
}
