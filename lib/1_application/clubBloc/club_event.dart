part of 'club_bloc.dart';

@immutable
abstract class ClubEvent {}

class ClubEventInit extends ClubEvent {}

class ClubEventDataUpdateRequested extends ClubEvent {}

class ClubEventUpdateListSorting extends ClubEvent {
  final SortMode sortMode;
  final List<ClubEntity> cachedClubData;

  ClubEventUpdateListSorting(
      {required this.sortMode, required this.cachedClubData});
}
