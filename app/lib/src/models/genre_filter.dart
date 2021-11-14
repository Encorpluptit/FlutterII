import 'package:movieapp/src/models/genre.dart';

class GenreFilter extends Genre {
  bool active = false;

  GenreFilter({required id, required name, active = false})
      : super(id: id, name: name) {
    active = active;
  }

  GenreFilter.fromJSON(result) : super.fromJSON(result);

  factory GenreFilter.clone(GenreFilter source) {
    return GenreFilter(id: source.id, name: source.name, active: source.active);
  }
}
