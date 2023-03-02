import 'package:flutter/material.dart';
import 'package:tv_shows/widgets/detail_widgets/background_image.dart';
import 'package:tv_shows/widgets/detail_widgets/film_details.dart';

import '../data/constants/app_colors.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Column(children: [
            const Flexible(flex: 4, child: BackImage()),
            Expanded(flex: 6, child: Container())
          ]),
          Column(
            children: [
              Expanded(flex: 3, child: Container()),
              const Expanded(flex: 6, child: FilmDetails())
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 16.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.backgroundSecondary,
                  shape: const CircleBorder(),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back, size: 50)),
          ),
        ],
      ),
    );
  }
}
