part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitialState extends AppState {}

class AppChangeTap extends AppState {}

class AddMoveFailure extends AppState {
  final String errMessage;

  AddMoveFailure({required this.errMessage});
}

class AddMoveSuccefully extends AppState {}

class RemoveMoveFailure extends AppState {
  final String errMessage;

  RemoveMoveFailure({required this.errMessage});
}

class RemoveMoveSuccefully extends AppState {}