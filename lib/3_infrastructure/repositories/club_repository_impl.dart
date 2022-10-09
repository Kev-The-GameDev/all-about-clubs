import 'package:aac/2_domain/failures/failures.dart';
import 'package:aac/2_domain/entities/club_entity.dart';
import 'package:aac/2_domain/repositories/club_repository.dart';
import 'package:aac/3_infrastructure/datasources/club_remote_datasource.dart';
import 'package:aac/3_infrastructure/exceptions/exceptions.dart';
import 'package:dartz/dartz.dart';

class ClubRepositoryImpl implements ClubRepository {
  final ClubRemoteDataSource remoteDataSource;

  ClubRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<ClubEntity>>> getClubDataFromApi() async {
    try {
      final clubData = await remoteDataSource.getClubDataFromApi();
      return Right(clubData);
    } catch (e) {
      if (e is ServerException) {
        return Left(ServerFailure());
      } else {
        return Left(GeneralFailure());
      }
    }
  }
}
