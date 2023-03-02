import 'package:flutter/material.dart';
import 'package:tv_shows/data/constants/app_colors.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late TextEditingController _textController;

  @override
  void initState() {
    _textController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        style: TextStyle(color: AppColors.textPrimary),
        decoration: InputDecoration(
            hintText: 'Search...', prefixIcon: Icon(Icons.search)),
      ),
    );
  }
}
