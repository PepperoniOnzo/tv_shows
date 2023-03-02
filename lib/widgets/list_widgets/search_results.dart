import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_shows/data/constants/app_colors.dart';
import 'package:tv_shows/views/app_view.dart';
import 'package:tv_shows/widgets/list_widgets/films_list.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: _buildChild(context),
        transitionBuilder: (child, animation) => FadeTransition(
          opacity: animation,
          child: child,
        ),
      ),
    );
  }

  Widget _buildChild(BuildContext context) {
    final appView = context.watch<AppView>();

    if (appView.isLoading) {
      return const CircularProgressIndicator(color: AppColors.textSecondary);
    } else if (appView.error) {
      return Text(
        appView.errorMessage,
        style: Theme.of(context).textTheme.headlineSmall,
      );
    } else {
      return const FilmList();
    }
  }
}
