import 'package:flutter/material.dart';
import 'package:tv_shows/data/constants/app_colors.dart';

class GenreContainer extends StatelessWidget {
  const GenreContainer({super.key, required this.genre});
  final String genre;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.backgroundSecondary, width: 3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(genre, style: Theme.of(context).textTheme.headlineSmall),
    );
  }
}
