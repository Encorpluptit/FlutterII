import 'package:intl/intl.dart';
import 'package:movieapp/src/models/base_model.dart';

class MovieDetailModel extends BaseModel {
  String _title = "";
  String _poster = "";
  String _synopsis = "";
  List _images = [];
  DateTime? _releaseDate;

  MovieDetailModel(result) {
    _title = result["data"]['title'];
    _poster = result["data"]['poster'];
    _synopsis = result["data"]['synopsis'];
    _images = result["data"]['images'];
    _releaseDate =
        DateFormat("yyyy-MM-dd").parse(result["data"]['release_date']);
  }

  String get title => _title;

  String get poster => _poster;

  String get synopsis => _synopsis;

  List get images => _images;

  DateTime? get releaseDate => _releaseDate;
}
