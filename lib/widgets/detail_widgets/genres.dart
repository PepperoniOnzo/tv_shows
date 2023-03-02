import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_shows/views/app_view.dart';

import '../../data/constants/app_colors.dart';

class Genres extends StatelessWidget {
  const Genres({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: context.read<AppView>().selectedFilm.genres.length,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.backgroundSecondary, width: 3),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(context.read<AppView>().selectedFilm.genres[index],
              style: Theme.of(context).textTheme.headlineSmall),
        );
      },
    );
  }
}
