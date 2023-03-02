import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_shows/views/app_view.dart';
import 'package:tv_shows/widgets/list_widgets/films_list.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: context.watch<AppView>().isLoading
            ? const CircularProgressIndicator()
            : context.watch<AppView>().error
                ? Text(context.watch<AppView>().errorMessage,
                    style: Theme.of(context).textTheme.headlineSmall)
                : const FilmList());
  }
}
