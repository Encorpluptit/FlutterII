import 'package:movieapp/src/models/base_model.dart';
import 'package:movieapp/src/models/item_model.dart';

class ListItemModel extends BaseModel {
  int _page = 0;
  int _totalResults = 0;
  int _totalPages = 0;
  List<ItemModel> _items = [];

  ListItemModel.fromJson(Map<String, dynamic> parsedJson) {
    print(parsedJson['results'].length);
    _page = parsedJson['page'];
    _totalResults = parsedJson['total_results'];
    _totalPages = parsedJson['total_pages'];
    List<ItemModel> temp = [];
    for (int i = 0; i < parsedJson['results'].length; i++) {
      ItemModel result = ItemModel(parsedJson['results'][i]);
      temp.add(result);
    }
    _items = temp;
  }

  List<ItemModel> get results => _items;

  int get totalPages => _totalPages;

  int get totalResults => _totalResults;

  int get page => _page;
}
