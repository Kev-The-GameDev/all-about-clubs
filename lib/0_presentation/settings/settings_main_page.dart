import 'package:aac/0_presentation/settings/widgets/settings_button_widget.dart';
import 'package:aac/0_presentation/settings/widgets/settings_darkMode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsMainPage extends StatelessWidget {
  const SettingsMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: themeData.appBarTheme.backgroundColor,
          title: Text(AppLocalizations.of(context)!.settings)),
      body: Column(
        children: [
          SettingsButton(
              text: AppLocalizations.of(context)!.about,
              onPressed: () {
                Navigator.of(context).pushNamed("/about");
              }),
          Divider(color: Theme.of(context).colorScheme.onPrimary, height: 5),
          SettingsButton(
              text: AppLocalizations.of(context)!.language,
              onPressed: () {
                Navigator.of(context).pushNamed("/languageSettings");
              }),
          Divider(color: Theme.of(context).colorScheme.onPrimary, height: 5),
          DarkModeSwitch(text: AppLocalizations.of(context)!.darkMode),
          Divider(color: Theme.of(context).colorScheme.onPrimary, height: 5)
        ],
      ),
    );
  }
}
