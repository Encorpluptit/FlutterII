import 'package:intl/intl.dart';
import 'package:movieapp/src/models/base_model.dart';

class Movie extends BaseModel {
  String _id = "";
  String _title = "";
  String _synopsis = "";
  String _release_date = "";
  String _poster = "";
  List<String> _images = [];

  Movie(result) {
    _id = result['id'];
    _title = result['title'];
    _synopsis = result['synopsis'];
    _release_date = result['release_date'];
    _poster = result['poster'];
    _images = [];
  }

  String get id => _id;
  String get title => _title;
  String get synopsis => _synopsis;
  String get releaseDate => _release_date;
  String get poster => _poster;
  List<String> get images => _images;
}
