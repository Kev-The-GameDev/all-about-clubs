import 'dart:convert';
import 'package:aac/2_domain/entities/club_entity.dart';
import 'package:aac/3_infrastructure/exceptions/exceptions.dart';
import 'package:aac/3_infrastructure/models/club_model.dart';
import 'package:http/http.dart' as http;

abstract class ClubRemoteDataSource {
  Future<List<ClubEntity>> getClubDataFromApi();
}

class ClubRemoteDataSourceImpl implements ClubRemoteDataSource {
  final http.Client client;
  final String dataSource = "https://public.allaboutapps.at/hiring/clubs.json";
  ClubRemoteDataSourceImpl({required this.client});

  @override
  // Get data from API
  Future<List<ClubEntity>> getClubDataFromApi() async {
    final response = await client.get(Uri.parse(dataSource),
        headers: {'Content-Type': 'application/json'});

    // if data received, model it to List of ClubEntity, else return ServerException
    if (response.statusCode == 200) {
      return modelJsonToList(response);
    } else {
      throw ServerException();
    }
  }

  // Json to List<ClubEntity> conversions
  List<ClubEntity> modelJsonToList(var response) {
    List<ClubEntity> clubs =
        (json.decode(utf8.decode(response.bodyBytes)) as List)
            .map((data) => ClubModel.fromJson(data))
            .toList();
    return clubs;
  }
}
