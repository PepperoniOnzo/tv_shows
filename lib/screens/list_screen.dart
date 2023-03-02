import 'package:flutter/material.dart';
import 'package:tv_shows/widgets/list_widgets/search_bar.dart';
import 'package:tv_shows/widgets/list_widgets/search_results.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: const <Expanded>[
          Expanded(flex: 2, child: SearchBar()),
          Expanded(flex: 14, child: SearchResults())
        ],
      ),
    );
  }
}
