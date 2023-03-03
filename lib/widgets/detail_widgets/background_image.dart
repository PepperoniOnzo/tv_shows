import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_shows/data/constants/app_colors.dart';

import '../../views/app_view.dart';

class BackImage extends StatelessWidget {
  const BackImage({super.key});

  @override
  Widget build(BuildContext context) {
    final String? imageUri =
        context.watch<AppView>().selectedFilm.imageOriginal;

    return Stack(children: [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageUri != null
                ? NetworkImage(imageUri)
                : Image.asset('assets/empty_poster.jpg').image,
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.transparent, AppColors.backgroundPrimary],
          ),
        ),
      ),
    ]);
  }
}
