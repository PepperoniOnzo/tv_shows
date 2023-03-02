import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_shows/data/constants/app_colors.dart';

import '../../views/app_view.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          onChanged: (value) {
            context.read<AppView>().setFilmName(value);
          },
          cursorColor: AppColors.textSecondary,
          decoration: const InputDecoration(
              hintText: 'Search...', prefixIcon: Icon(Icons.search)),
        ),
      ),
    );
  }
}
