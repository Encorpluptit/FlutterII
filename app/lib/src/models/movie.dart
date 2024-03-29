class Movie {
  String _id = "";
  String _title = "";
  String _synopsis = "";
  String _release_date = "";
  String _poster = "";
  List<String> _images = [];
  List<String> _genres = [];

  Movie(result) {
    _id = result['id'];
    _title = result['title'];
    _synopsis = result['synopsis'];
    _release_date = result['release_date'];
    _poster = result['poster'];
    for (var i = 0; i < result["images"].length; i++) {
      _images.add(result["images"][i]);
    }
    for (var i = 0; i < result["genres"].length; i++) {
      _genres.add(result["genres"][i]);
    }
  }

  String get id => _id;
  String get title => _title;
  String get synopsis => _synopsis;
  String get releaseDate => _release_date;
  String get poster => _poster;
  List<String> get images => _images;
  List<String> get genres => _genres;
}
