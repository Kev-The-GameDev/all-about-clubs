import 'package:aac/1_application/theme_locale/themeAndLocaleService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class LanguageButton extends StatelessWidget {
  final String buttonText;
  final String flagImage;
  final String locale;

  const LanguageButton(
      {Key? key,
      required this.locale,
      required this.buttonText,
      required this.flagImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeAndLocaleService>(
        builder: (context, themeAndLocaleService, child) {
      return InkWell(
        onTap: () {
          themeAndLocaleService.setLocale(locale);
        },
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 60,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(buttonText,
                        style: Theme.of(context)
                            .textTheme
                            .headline2!
                            .copyWith(fontSize: 18)),
                    Container(
                        height: 30,
                        width: 40,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3)),
                        ]),
                        child: SvgPicture.asset(flagImage)),
                  ],
                )),
          ),
        ),
      );
    });
  }
}
