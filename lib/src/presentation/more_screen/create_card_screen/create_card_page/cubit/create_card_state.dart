part of 'create_card_cubit.dart';

@immutable
abstract class CreateCardState {}

class CreateCardInitial extends CreateCardState {}
class CreateCardLoading extends CreateCardState {}
class CreateCardLoaded extends CreateCardState {}
class CreateCardError extends CreateCardState {
  final String errorText;
  CreateCardError({required this.errorText});
}
class CreateCardImageUploaded extends CreateCardState {}