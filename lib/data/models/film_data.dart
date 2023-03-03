class FilmData {
  final String? image;
  final String? imageOriginal;
  final String name;
  final List<String> genres;
  final double rating;
  final String url;
  final String status;
  final Map<String, List<String>> schedule;
  final String? summary;

  FilmData({
    this.image,
    this.imageOriginal,
    required this.name,
    required this.genres,
    required this.rating,
    required this.url,
    required this.status,
    required this.schedule,
    this.summary,
  });

  factory FilmData.fromJson(Map<String, dynamic> json) {
    return FilmData(
        image: json['show']['image'] != null
            ? json['show']['image']['medium']
            : null,
        imageOriginal: json['show']['image'] != null
            ? json['show']['image']['original']
            : null,
        name: json['show']['name'],
        genres: List<String>.from(json['show']['genres']),
        rating: json['show']['rating']['average'] != null
            ? json['show']['rating']['average'].toDouble()
            : 0.0,
        url: json['show']['url'],
        status: json['show']['status'],
        schedule: {
          json['show']['schedule']['time']:
              List<String>.from(json['show']['schedule']['days'])
        },
        summary: json['show']['summary']?.replaceAll(RegExp(r'<[^>]*>'), ''));
  }
}
