import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_shows/data/constants/app_colors.dart';
import 'package:tv_shows/views/app_view.dart';

class Schedule extends StatelessWidget {
  Schedule({super.key});
  final List<String> days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  @override
  Widget build(BuildContext context) {
    final appView = context.read<AppView>();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
              appView.selectedFilm.schedule.keys.first == ''
                  ? 'No schedule available'
                  : appView.selectedFilm.schedule.keys.first,
              style: Theme.of(context).textTheme.headlineSmall),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(days.length, (index) {
              Color color = appView.selectedFilm.schedule.values.first
                      .contains(days[index])
                  ? AppColors.star
                  : AppColors.backgroundSecondary;

              return Text(
                  days[index]
                      .substring(0, 3)
                      .toUpperCase()
                      .split('')
                      .join('\n'),
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .apply(color: color));
            })),
      ],
    );
  }
}
