import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_shows/data/constants/app_colors.dart';
import 'package:tv_shows/views/app_view.dart';
import 'package:tv_shows/widgets/detail_widgets/genres.dart';
import 'package:tv_shows/widgets/detail_widgets/schedule.dart';

class FilmDetails extends StatelessWidget {
  const FilmDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(context.read<AppView>().selectedFilm.name,
                    style: Theme.of(context).textTheme.headlineMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis),
              ),
              ElevatedButton(
                onPressed: () async {
                  launchUrl(
                      mode: LaunchMode.externalApplication,
                      Uri.parse(context.read<AppView>().selectedFilm.url));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.backgroundSecondary,
                  shape: const CircleBorder(),
                ),
                child: const Icon(Icons.arrow_outward_outlined, size: 50),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.star, color: AppColors.star),
                  Text(context.read<AppView>().selectedFilm.rating.toString(),
                      style: Theme.of(context).textTheme.headlineSmall!.apply(
                            color: AppColors.star,
                          )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(context.read<AppView>().selectedFilm.status,
                    style: Theme.of(context).textTheme.bodyLarge!.apply(
                          color: AppColors.textSecondary,
                        )),
              ),
            ],
          ),
          Container(
              constraints: const BoxConstraints(maxHeight: 50),
              child: const Expanded(child: Genres())),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
                context.read<AppView>().selectedFilm.summary ?? 'No summary',
                overflow: TextOverflow.ellipsis,
                maxLines: 15,
                style: Theme.of(context).textTheme.titleMedium),
          ),
          const Divider(
            color: AppColors.backgroundSecondary,
            thickness: 1,
          ),
          Expanded(child: Schedule())
        ],
      ),
    );
  }
}
