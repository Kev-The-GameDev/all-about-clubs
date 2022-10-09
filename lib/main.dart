import 'package:aac/0_presentation/club/club_details_page.dart';
import 'package:aac/0_presentation/root_page.dart';
import 'package:aac/0_presentation/settings/settings_about_page.dart';
import 'package:aac/0_presentation/settings/settings_language_page.dart';
import 'package:aac/1_application/clubBloc/club_bloc.dart';
import 'package:aac/1_application/theme_locale/themeAndLocaleService.dart';
import 'package:aac/injection.dart';
import 'package:aac/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'injection.dart' as di; // dependency injection
import 'injection.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeAndLocaleService(),
    child: const AllAboutClubs(),
  ));
  //runApp(const AllAboutClubs());
}

class AllAboutClubs extends StatelessWidget {
  const AllAboutClubs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeAndLocaleService>(
        builder: (context, themeAndLocaleService, child) {
      // get shared preferences from di
      final prefs = serviceLocator<SharedPreferences>();

      // load last used locale
      String? locale = prefs.getString('locale');
      locale ??= 'en';

      // load last used theme
      bool? darkMode = prefs.getBool('darkMode');
      darkMode ??= false;

      themeAndLocaleService.setLoadedData(locale, darkMode);

      return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'all about clubs',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeAndLocaleService.darkModeOn
              ? ThemeMode.dark
              : ThemeMode.light,
          routes: <String, WidgetBuilder>{
            "/root": (BuildContext context) => const RootPage(),
            "/clubDetails": (BuildContext context) => const ClubDetailsPage(),
            "/about": (BuildContext context) => const AboutPage(),
            "/languageSettings": (BuildContext context) =>
                LanguageSettingsPage(),
          },
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English
            Locale('de', ''), // German
            Locale('pl', ''), // Polish
          ],
          locale: themeAndLocaleService.currentLocale,
          home: BlocProvider(
              create: (context) =>
                  serviceLocator<ClubBloc>()..add(ClubEventInit()),
              child: const RootPage()));
    });
  }
}
