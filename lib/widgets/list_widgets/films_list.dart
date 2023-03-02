import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_shows/data/constants/app_colors.dart';
import 'package:tv_shows/views/app_view.dart';

class FilmList extends StatelessWidget {
  const FilmList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.6,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: context.watch<AppView>().films.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            final String? imageUri =
                context.watch<AppView>().films[index].image;
            return GestureDetector(
              onTap: () {
                context.read<AppView>().setSelectedFilm(index);
                Navigator.pushNamed(context, '/details');
              },
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10.0),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          opacity: 0.8,
                          image: imageUri != null
                              //TODO loadingBuilder
                              ? Image.network(imageUri).image
                              : Image.asset('assets/empty_poster.jpg').image,
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              context
                                  .watch<AppView>()
                                  .films[index]
                                  .rating
                                  .toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.star,
                                shadows: [
                                  Shadow(
                                    color: AppColors.backgroundPrimary
                                        .withOpacity(0.5),
                                    offset: const Offset(0.0, 0.0),
                                    blurRadius: 5.0,
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        context.watch<AppView>().films[index].name,
                        style: Theme.of(context).textTheme.bodyLarge,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
