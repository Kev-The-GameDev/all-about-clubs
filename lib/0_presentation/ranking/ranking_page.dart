import 'package:aac/0_presentation/errors/general_error_page.dart';
import 'package:aac/0_presentation/loading/loading_page.dart';
import 'package:aac/0_presentation/ranking/ranking_table_widget.dart';
import 'package:aac/1_application/clubBloc/club_bloc.dart';
import 'package:aac/2_domain/entities/club_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClubRankingPage extends StatefulWidget {
  const ClubRankingPage({Key? key}) : super(key: key);

  @override
  State<ClubRankingPage> createState() => _ClubRankingPageState();
}

class _ClubRankingPageState extends State<ClubRankingPage> {
  // Variables
  late SortMode _currentSortMode = SortMode.alphabeticly;
  List<ClubEntity> _cachedClubData = List<ClubEntity>.empty();

  @override
  Widget build(BuildContext context) {
    // Cache themeData
    ThemeData themeData = Theme.of(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: themeData.appBarTheme.backgroundColor,
          title: const Text("all about clubs"),
          actions: [
            IconButton(
                onPressed: onSortButtonPressed,
                icon: const Icon(Icons.filter_list))
          ],
        ),
        body: BlocBuilder<ClubBloc, ClubState>(
            bloc: BlocProvider.of<ClubBloc>(context),
            builder: (context, clubState) {
              if (clubState is ClubInitial) {
                // INITIAL
                return const LoadingScreen();
              } else if (clubState is ClubStateDataLoaded) {
                // DATA LOADED - SHOW CLUB LIST
                _cachedClubData = clubState.clubList;
                return RankingTableWidget(
                  clubList: clubState.clubList,
                  sortMode: _currentSortMode,
                );
              } else if (clubState is ClubStateError) {
                // ERROR
                return ErrorPage(
                    errorImage: clubState.errorImage,
                    failure: clubState.failure);
              } else {
                // FALLBACK TO LOADING
                return const LoadingScreen();
              }
            }));
  }

  onSortButtonPressed() {
    // Toggle Filter mode
    _currentSortMode = _currentSortMode == SortMode.byValue
        ? SortMode.alphabeticly
        : SortMode.byValue;

    // Update list view
    BlocProvider.of<ClubBloc>(context).add(ClubEventUpdateListSorting(
        sortMode: _currentSortMode, cachedClubData: _cachedClubData));
  }
}

enum SortMode { alphabeticly, byValue }
