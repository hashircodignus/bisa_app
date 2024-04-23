part of 'create_card_cubit.dart';

@immutable
abstract class CreateCardState {}

class CreateCardInitial extends CreateCardState {}
class CreateCardLoading extends CreateCardState {}
class CreateCardCreated extends CreateCardState {}
class CreateCardLoaded extends CreateCardState {
  final List<CardModel> cardModel;
  CreateCardLoaded({required this.cardModel});
}
class CreateCardSaved extends CreateCardState {}
class CreateCardSuccess extends CreateCardState {
  final List<SavedCardModel> savedCardModel;
  CreateCardSuccess({required this.savedCardModel});
}
class CreateCardSavedAlready extends CreateCardState {
  final String isSavedText;
  CreateCardSavedAlready({required this.isSavedText});
}
class CreateCardError extends CreateCardState {
  final String errorText;
  CreateCardError({required this.errorText});
}
class CreateCardImageUploaded extends CreateCardState {
   final AssetImage assetImage;

  CreateCardImageUploaded({required this.assetImage});


}