import 'package:aac/1_application/clubBloc/club_bloc.dart';
import 'package:aac/2_domain/failures/failures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ErrorPage extends StatelessWidget {
  final generalFailureIcon = "assets/failure_icons/red-alert-icon.png";
  final networkFailureIcon = "assets/failure_icons/no-wifi-icon.png";
  final serverFailureIcon = "assets/failure_icons/red-alert-icon.png";

  final Failure failure;
  final String errorImage;

  const ErrorPage({Key? key, required this.errorImage, required this.failure})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double iconSize = 125;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: iconSize,
                width: iconSize,
                child: Image.asset(errorImage)),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(_mapFailureToMessage(failure, context),
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(fontSize: 18),
                  textAlign: TextAlign.center),
            ),
            const SizedBox(height: 30),
            InkWell(
              onTap: () => BlocProvider.of<ClubBloc>(context)
                  .add(ClubEventDataUpdateRequested()),
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3))
                    ]),
                width: 200,
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.tryAgain,
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(width: 10),
                      const Icon(Icons.replay_outlined, color: Colors.white)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  String _mapFailureToMessage(Failure failure, BuildContext context) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppLocalizations.of(context)!.error_Server;

      case GeneralFailure:
        return AppLocalizations.of(context)!.error_General;

      case NetworkFailure:
        return AppLocalizations.of(context)!.error_Network;

      default:
        return AppLocalizations.of(context)!.error_General;
    }
  }
}
