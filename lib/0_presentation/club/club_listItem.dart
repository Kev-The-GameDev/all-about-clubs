import 'package:aac/2_domain/entities/club_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ClubListItem extends StatelessWidget {
  final ClubEntity clubEntity;

  const ClubListItem({Key? key, required this.clubEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Variables
    ThemeData themeData = Theme.of(context);
    double logoSize = 90;

    return InkWell(
        onTap: () => onItemPressed(clubEntity, context),
        child: SizedBox(
            height: 125.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      width: logoSize,
                      height: logoSize,
                      child: Image.network(clubEntity.image)),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(clubEntity.name,
                            style: themeData.textTheme.headline2!
                                .copyWith(fontSize: 22)),
                        const SizedBox(height: 5),
                        Text(getLocalizedCountry(clubEntity.country, context),
                            style: const TextStyle(
                                fontSize: 14, color: Colors.grey)),
                        Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                                "${clubEntity.value} ${AppLocalizations.of(context)!.million} €",
                                style: themeData.textTheme.headline2!
                                    .copyWith(fontSize: 18)))
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }

  void onItemPressed(ClubEntity clubEntity, BuildContext context) {
    Navigator.of(context).pushNamed("/clubDetails", arguments: clubEntity);
  }

  String getLocalizedCountry(String country, BuildContext context) {
    switch (country) {
      case "England":
        return AppLocalizations.of(context)!.england;
      case "Deutschland":
        return AppLocalizations.of(context)!.deutschland;
      case "Frankreich":
        return AppLocalizations.of(context)!.frankreich;
      case "Italien":
        return AppLocalizations.of(context)!.italien;
      case "Niederlande":
        return AppLocalizations.of(context)!.niederlande;
      case "Spanien":
        return AppLocalizations.of(context)!.spanien;
      case "Österreich":
        return AppLocalizations.of(context)!.oesterreich;
      default:
        return AppLocalizations.of(context)!.noData;
    }
  }
}
