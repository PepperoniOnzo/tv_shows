import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_shows/views/app_view.dart';
import 'package:tv_shows/widgets/detail_widgets/genre_container.dart';

class Genres extends StatelessWidget {
  const Genres({super.key});

  @override
  Widget build(BuildContext context) {
    final appView = context.read<AppView>();

    return appView.selectedFilm.genres.isNotEmpty
        ? ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: appView.selectedFilm.genres.length,
            itemBuilder: (context, index) {
              return GenreContainer(genre: appView.selectedFilm.genres[index]);
            },
          )
        : const GenreContainer(genre: "No genres available");
  }
}
