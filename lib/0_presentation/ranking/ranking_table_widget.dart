import 'package:aac/0_presentation/club/club_listItem.dart';
import 'package:aac/0_presentation/ranking/ranking_page.dart';
import 'package:aac/2_domain/entities/club_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RankingTableWidget extends StatelessWidget {
  final List<ClubEntity> clubList;
  final SortMode sortMode;

  const RankingTableWidget(
      {Key? key, required this.clubList, required this.sortMode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(children: [
              Text(AppLocalizations.of(context)!.sortedBy,
                  style: themeData.textTheme.headline2),
              const SizedBox(width: 10),
              Text(
                  sortMode == SortMode.byValue
                      ? AppLocalizations.of(context)!.value
                      : "A - Z",
                  style: themeData.textTheme.bodyText1)
            ]),
          ),
          Expanded(
              child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      Divider(color: Theme.of(context).colorScheme.onPrimary),
                  itemCount: clubList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ClubListItem(clubEntity: clubList[index]);
                  }))
        ]);
  }
}
