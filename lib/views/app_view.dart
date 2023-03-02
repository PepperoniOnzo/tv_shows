import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tv_shows/data/constants/search_strings.dart';
import 'package:tv_shows/data/models/film_data.dart';
import 'package:tv_shows/services/http_service.dart';

import 'package:http/http.dart' as http;

class AppView extends ChangeNotifier {
  List<FilmData> films = [];
  bool isLoading = false;

  bool error = true;
  String errorMessage = SearchStrings.searchEmpty;

  String filmName = '';

  void setFilmName(String name) {
    filmName = name;

    if (filmName.length > 2) {
      fetchFilms(filmName);
    } else {
      films = [];
      isLoading = false;
      error = true;
      errorMessage = SearchStrings.searchEmpty;
      notifyListeners();
    }
  }

  Future<void> fetchFilms(String filmName) async {
    isLoading = true;
    notifyListeners();

    final http.Response response = await HttpService.get(filmName);

    films = [];
    if (response.statusCode == 200) {
      var filmData = jsonDecode(response.body);

      for (var item in filmData) {
        films.add(FilmData.fromJson(item));
      }
    }

    if (films.isEmpty) {
      errorMessage = SearchStrings.searchError;
      error = true;
    } else {
      error = false;
    }

    isLoading = false;

    notifyListeners();
  }
}
