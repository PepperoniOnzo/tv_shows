import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../views/app_view.dart';

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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _textController,
        onChanged: (value) {
          context.read<AppView>().setFilmName(value);
        },
        decoration: const InputDecoration(
            hintText: 'Search...', prefixIcon: Icon(Icons.search)),
      ),
    );
  }
}
