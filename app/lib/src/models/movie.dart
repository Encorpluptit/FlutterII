import 'package:intl/intl.dart';
import 'package:movieapp/src/models/base_model.dart';

class Movie extends BaseModel {
  int _voteCount = 0;
  int _id = 0;
  bool _video = false;
  double _voteAverage = 0;
  String _title = "";
  double _popularity = 0;
  String _posterPath = "";
  String _originalLanguage = "";
  String _originalTitle = "";
  final List<int> _genreIDs = [];
  String _backdropPath = "";
  bool _adult = false;
  String _overview = "";
  DateTime? _releaseDate;

  Movie(result) {
    _voteCount = result['vote_count'];
    _id = result['id'];
    _video = result['video'];
    _voteAverage = result['vote_average'];
    _title = result['title'];
    _popularity = result['popularity'];
    _posterPath = result['poster_path'];
    _originalLanguage = result['original_language'];
    _originalTitle = result['original_title'];
    for (int i = 0; i < result['genre_ids'].length; i++) {
      _genreIDs.add(result['genre_ids'][i]);
    }
    _backdropPath = result['backdrop_path'];
    _adult = result['adult'];
    _overview = result['overview'];
    _releaseDate = DateFormat("yyyy-MM-dd").parse(result['release_date']);
  }

  DateTime? get releaseDate => _releaseDate;

  String get overview => _overview;

  bool get adult => _adult;

  String get backdropPath => _backdropPath;

  List<int> get genreIDs => _genreIDs;

  String get originalTitle => _originalTitle;

  String get originalLanguage => _originalLanguage;

  String get posterPath => _posterPath;

  double get popularity => _popularity;

  String get title => _title;

  double get voteAverage => _voteAverage;

  bool get video => _video;

  int get id => _id;

  int get voteCount => _voteCount;
}
