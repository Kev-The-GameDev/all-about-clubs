import 'package:aac/0_presentation/ranking/ranking_page.dart';
import 'package:aac/0_presentation/settings/settings_main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // cache ThemeData
    ThemeData themeData = Theme.of(context);

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: const [ClubRankingPage(), SettingsMainPage()],
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          currentIndex: _currentIndex,
          unselectedItemColor: Colors.grey.shade700,
          selectedItemColor: themeData.appBarTheme.iconTheme!.color,
          backgroundColor: themeData.appBarTheme.backgroundColor,
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.leaderboard),
                label: AppLocalizations.of(context)!.ranking),
            BottomNavigationBarItem(
                icon: const Icon(Icons.settings),
                label: AppLocalizations.of(context)!.settings)
          ]),
    );
  }
}
