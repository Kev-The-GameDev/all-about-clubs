part of 'club_bloc.dart';

@immutable
abstract class ClubState {}

class ClubInitial extends ClubState {}

class ClubStateLoadingData extends ClubState {}

class ClubStateDataLoaded extends ClubState {
  List<ClubEntity> clubList;
  ClubStateDataLoaded({required this.clubList});
}

class ClubStateError extends ClubState {
  String errorImage;
  Failure failure;
  ClubStateError({required this.errorImage, required this.failure});
}

enum ErrorType { general, internet, server }
