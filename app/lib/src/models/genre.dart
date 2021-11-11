import 'package:intl/intl.dart';
import 'package:movieapp/src/models/base_model.dart';

class Genre extends BaseModel {
  String _id = "";
  String _name = "";

  Genre(result) {
    _id = result['id'];
    _name = result['name'];
  }

  String get id => _id;
  String get name => _name;
}
