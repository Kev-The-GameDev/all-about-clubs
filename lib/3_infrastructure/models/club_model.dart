import 'package:aac/2_domain/entities/club_entity.dart';

class ClubModel extends ClubEntity {
  ClubModel(
      {required String name,
      required String country,
      required int value,
      required String image,
      required int europeanTitles})
      : super(
            name: name,
            country: country,
            value: value,
            image: image,
            europeanTitles: europeanTitles);

  factory ClubModel.fromJson(Map<String, dynamic> json) {
    return ClubModel(
        name: json["name"],
        country: json["country"],
        value: json["value"],
        image: json["image"],
        europeanTitles: json["european_titles"]);
  }
}
