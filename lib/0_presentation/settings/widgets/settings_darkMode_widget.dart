import 'dart:io';
import 'package:aac/1_application/theme_locale/themeAndLocaleService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DarkModeSwitch extends StatelessWidget {
  final String text;
  const DarkModeSwitch({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeAndLocaleService>(
        builder: (context, themeService, child) {
      return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 60,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(text,
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(fontSize: 18)),
                  Platform.isAndroid
                      ? Switch(
                          value: themeService.darkModeOn,
                          onChanged: (value) {
                            Provider.of<ThemeAndLocaleService>(context,
                                    listen: false)
                                .toggleTheme();
                          })
                      : CupertinoSwitch(
                          value: themeService.darkModeOn,
                          onChanged: (value) {
                            Provider.of<ThemeAndLocaleService>(context,
                                    listen: false)
                                .toggleTheme();
                          })
                ],
              )),
        ),
      );
    });
  }
}
