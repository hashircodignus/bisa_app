part of 'card_view_cubit.dart';

@immutable
abstract class CardViewState {}

class CardViewInitial extends CardViewState {}
class CardViewLoading extends CardViewState {}
class CardViewLoaded extends CardViewState {
  final DocumentSnapshot<Map<String, dynamic>> cardData;
  CardViewLoaded({required this.cardData});
}
class CardViewError extends CardViewState {
  final error;
  CardViewError({this.error});
}
