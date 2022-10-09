import 'package:aac/2_domain/entities/club_entity.dart';
import 'package:aac/2_domain/failures/failures.dart';
import 'package:aac/2_domain/repositories/club_repository.dart';
import 'package:dartz/dartz.dart';

class ClubUsecases {
  final ClubRepository clubRepository;

  ClubUsecases({required this.clubRepository});

  Future<Either<Failure, List<ClubEntity>>> getClubDataUsecase() async {
    return clubRepository.getClubDataFromApi();
  }

  List<ClubEntity> sortListByHighestValue(List<ClubEntity> listToSort) {
    List<ClubEntity> sortedList = listToSort;
    sortedList.sort(((a, b) => b.value.compareTo(a.value)));
    return sortedList;
  }

  List<ClubEntity> sortListByAlphabet(List<ClubEntity> listToSort) {
    List<ClubEntity> sortedList = listToSort;
    sortedList.sort(((a, b) => a.name.compareTo(b.name)));
    return sortedList;
  }
}
