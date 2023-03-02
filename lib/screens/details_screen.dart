import 'package:flutter/material.dart';
import 'package:tv_shows/widgets/detail_widgets/background_image.dart';
import 'package:tv_shows/widgets/detail_widgets/film_details.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          )
        ],
      ),
    );
  }
}
