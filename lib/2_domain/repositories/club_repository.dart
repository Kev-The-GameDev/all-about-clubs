import 'package:aac/2_domain/entities/club_entity.dart';
import 'package:aac/2_domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

abstract class ClubRepository {
  Future<Either<Failure, List<ClubEntity>>> getClubDataFromApi();
}
