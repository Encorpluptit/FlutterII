import 'package:movieapp/src/models/base_model.dart';

class Genre extends BaseModel {
  int _id = 0;
  String _name = "";

  Genre({required id, required String name}) {
    _id = id;
    _name = name;
  }

  Genre.fromJSON(result) {
    _id = result['id'];
    _name = result['name'];
  }

  int get id => _id;
  String get name => _name;
}
