import 'dart:convert';
import 'dart:io';

import 'package:test/test.dart';
import 'package:tv_shows/data/models/film_data.dart';
import 'package:tv_shows/services/http_service.dart';

void main() {
  test('Json parsing', () {
    String json = File('test/mock.json').readAsStringSync();
    var filmData = jsonDecode(json);

    List<FilmData> films = [];

    for (var item in filmData) {
      films.add(FilmData.fromJson(item));
    }

    expect(films.length, 10);
  });

  test('Http get', () {
    String filmName = 'witcher';

    HttpService.get(filmName).then((response) {
      expect(response.statusCode, 200);

      var filmData = jsonDecode(response.body);
      List<FilmData> films = [];

      for (var item in filmData) {
        films.add(FilmData.fromJson(item));
      }

      expect(films.length, 10);
    });
  });
}
