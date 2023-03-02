import 'package:http/http.dart' as http;

class HttpService {
  static final Uri _uri = Uri.parse("https://api.tvmaze.com/search/shows");

  static Future<http.Response> get(String filmName) async {
    try {
      return await http.get(_uri.replace(queryParameters: {'q': filmName}));
    } catch (e) {
      return http.Response('{"error": "Error"}', 500);
    }
  }
}
