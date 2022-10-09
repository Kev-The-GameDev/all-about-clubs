import 'package:aac/2_domain/entities/club_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ClubDetailsPage extends StatelessWidget {
  const ClubDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    final clubEntity = ModalRoute.of(context)!.settings.arguments as ClubEntity;

    double logoSize = 140;
    String localizedTrophiesSingle = AppLocalizations.of(context)!
        .trophiesSingle(clubEntity.name, clubEntity.europeanTitles);
    String localizedTrophiesMultipleOrNone = AppLocalizations.of(context)!
        .trophiesMultipleOrNone(clubEntity.name, clubEntity.europeanTitles);

    return Scaffold(
        appBar: AppBar(
            backgroundColor: themeData.appBarTheme.backgroundColor,
            title: Text(clubEntity.name)),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.grey.shade800,
              width: MediaQuery.of(context).size.width,
              height: 200,
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: logoSize,
                      width: logoSize,
                      child: Image.network(clubEntity.image),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                          getLocalizedCountry(clubEntity.country, context),
                          style: themeData.textTheme.headline2!
                              .copyWith(fontSize: 22, color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Text(
                    AppLocalizations.of(context)!.clubDetail_value(
                        clubEntity.name,
                        getLocalizedCountry(clubEntity.country, context),
                        clubEntity.value),
                    style: themeData.textTheme.bodyText2),
                const SizedBox(height: 10),
                Text(
                    clubEntity.europeanTitles == 1
                        ? localizedTrophiesSingle
                        : localizedTrophiesMultipleOrNone,
                    style: themeData.textTheme.bodyText2),
                const SizedBox(height: 10),
              ]),
            )
          ],
        ));
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
