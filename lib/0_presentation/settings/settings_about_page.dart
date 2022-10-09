import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.grey.shade600,
      appBar: AppBar(
          backgroundColor: themeData.appBarTheme.backgroundColor,
          title: Text(AppLocalizations.of(context)!.about)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("This app was developed by:",
                style: TextStyle(color: Colors.white)),
            const SizedBox(height: 15),
            const Text("Kevin Hell",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
            const SizedBox(height: 15),
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
                children: <TextSpan>[
                  TextSpan(text: 'as a '),
                  TextSpan(
                      text: 'hiring project',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: ' for')
                ],
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
              child: Image.asset("assets/logos/aaa-logo-white.png"),
            )
          ],
        ),
      ),
    );
  }
}
