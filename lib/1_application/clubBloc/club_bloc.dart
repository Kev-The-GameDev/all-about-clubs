import 'package:aac/0_presentation/ranking/ranking_page.dart';
import 'package:aac/2_domain/entities/club_entity.dart';
import 'package:aac/2_domain/failures/failures.dart';
import 'package:aac/2_domain/useCases/club_useCases.dart';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'club_event.dart';
part 'club_state.dart';

const GENERAL_FAILURE_MESSAGE = "Ups, something went wrong! Please Try again!";
const GENERAL_FAILURE_ICON = "assets/failure_icons/red_alert_icon.png";

const NETWORK_FAILURE_MESSAGE =
    "Ups, you have no internet connection! Please Try again!";
const NETWORK_FAILURE_ICON = "assets/failure_icons/no-wifi-icon.png";

const SERVER_FAILURE_MESSAGE = "Ups, API error! Please try again!";
const SERVER_FAILURE_ICON = "assets/failure_icons/red-alert-icon.png";

class ClubBloc extends Bloc<ClubEvent, ClubState> {
  final ClubUsecases usecases;

  ClubBloc({required this.usecases}) : super(ClubInitial()) {
    on<ClubEventInit>((event, emit) {
      // Make sure loading indicator is shown on startup
      emit(ClubStateLoadingData());

      // Trigger Update requested event
      add(ClubEventDataUpdateRequested());
    });

    on<ClubEventDataUpdateRequested>((event, emit) async {
      // Show loading indicator
      emit(ClubStateLoadingData());

      // Check internet connectivity
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        emit(ClubStateError(
            errorImage: _mapFailureToImage(NetworkFailure()),
            failure: NetworkFailure()));
        return;
      }

      // Try to get club data from backend
      Either<Failure, List<ClubEntity>> clubOrFailure =
          await usecases.getClubDataUsecase();

      // emit state according to API response
      clubOrFailure.fold(
          (failure) => emit(ClubStateError(
              errorImage: _mapFailureToImage(failure), failure: failure)),
          (clubData) => (emit(ClubStateDataLoaded(
              clubList: usecases.sortListByAlphabet(clubData)))));
    });

    on<ClubEventUpdateListSorting>((event, emit) {
      // Create empty list.
      List<ClubEntity> sortedList = List<ClubEntity>.empty();

      // Use switch to easily add more modes in future.
      // Sort list according to sort mode.
      switch (event.sortMode) {
        case SortMode.alphabeticly:
          sortedList = usecases.sortListByAlphabet(event.cachedClubData);
          break;
        case SortMode.byValue:
          sortedList = usecases.sortListByHighestValue(event.cachedClubData);
          break;
      }

      // Update list.
      emit(ClubStateDataLoaded(clubList: sortedList));
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;

      case GeneralFailure:
        return GENERAL_FAILURE_MESSAGE;

      case NetworkFailure:
        return NETWORK_FAILURE_MESSAGE;

      default:
        return GENERAL_FAILURE_MESSAGE;
    }
  }

  String _mapFailureToImage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_ICON;

      case GeneralFailure:
        return GENERAL_FAILURE_ICON;

      case NetworkFailure:
        return NETWORK_FAILURE_ICON;

      default:
        return GENERAL_FAILURE_ICON;
    }
  }
}
