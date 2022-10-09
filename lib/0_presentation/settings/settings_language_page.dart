import 'package:aac/0_presentation/settings/widgets/settings_language_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageSettingsPage extends StatelessWidget {
  final String germanFlag = "assets/flags/de.svg";
  final String englishFlag = "assets/flags/gb.svg";
  final String polishFlag = "assets/flags/pl.svg";

  const LanguageSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: themeData.appBarTheme.backgroundColor,
          title: Text(AppLocalizations.of(context)!.language)),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LanguageButton(
                locale: 'de', buttonText: "Deutsch", flagImage: germanFlag),
            Divider(color: Theme.of(context).colorScheme.onPrimary, height: 5),
            LanguageButton(
                locale: 'en', buttonText: "English", flagImage: englishFlag),
            Divider(color: Theme.of(context).colorScheme.onPrimary, height: 5),
            LanguageButton(
                locale: 'pl', buttonText: "Polska", flagImage: polishFlag),
            Divider(color: Theme.of(context).colorScheme.onPrimary, height: 5)
          ],
        ),
      ),
    );
  }
}
