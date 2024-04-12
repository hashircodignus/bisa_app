import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'card_view_state.dart';

class CardViewCubit extends Cubit<CardViewState> {
  CardViewCubit() : super(CardViewInitial());

  void fetchData(String cardId) async {
    try{
      emit(CardViewLoading());
      DocumentSnapshot<Map<String,dynamic>> cardDocument =
          await FirebaseFirestore.instance
      .collection('cards').doc(cardId).get();
      emit(CardViewLoaded(cardData: cardDocument));
    }catch (e){
      emit(CardViewError(error: e));
    }
  }
}
