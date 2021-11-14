import 'package:movieapp/src/models/genre.dart';

class GenreFilter extends Genre {
  bool active;

  GenreFilter({required id, required name, this.active = false})
      : super(id: id, name: name);

  GenreFilter.fromJSON(result, {this.active = false}) : super.fromJSON(result);

  factory GenreFilter.clone(GenreFilter source) {
    return GenreFilter(id: source.id, name: source.name, active: source.active);
  }
}
