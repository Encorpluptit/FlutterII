import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/src/blocs/genres_list/genre_list_bloc.dart';
import 'package:movieapp/src/blocs/provider.dart';
import 'package:movieapp/src/models/genre_filter.dart';

class MyFilterListView extends StatefulWidget {
  final List<GenreFilter> filteredGenres;

  const MyFilterListView({Key? key, required this.filteredGenres})
      : super(key: key);

  @override
  _MyFilterListState createState() => _MyFilterListState();
}

class _MyFilterListState extends State<MyFilterListView> {
  GenreListBloc bloc = Provider.getBloc<GenreListBloc>() as GenreListBloc;
  List<GenreFilter> tmpFilters = [];

  @override
  void initState() {
    tmpFilters = widget.filteredGenres
        .map((genre) =>
            GenreFilter(id: genre.id, name: genre.name, active: genre.active))
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();

    return AlertDialog(
      title: const Text("Filters"),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      actions: <Widget>[
        TextButton(
          child: const Text('Reset'),
          onPressed: () {
            setState(() {
              for (int i = 0; i < tmpFilters.length; i++) {
                tmpFilters[i].active = false;
              }
            });
          },
        ),
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: const Text('Confirm'),
          onPressed: () {
            bloc.dispatch(
              GenreListUpdateFilters(widget.filteredGenres, tmpFilters),
            );
            Navigator.pop(context);
          },
        ),
      ],
      content: SingleChildScrollView(
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Divider(),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.5,
                ),
                child: Scrollbar(
                  // isAlwaysShown: true,
                  controller: _scrollController,
                  child: ListView.builder(
                      shrinkWrap: false,
                      itemCount: tmpFilters.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CheckboxListTile(
                            title: Text(tmpFilters[index].name),
                            value: tmpFilters[index].active,
                            onChanged: (value) {
                              setState(() {
                                if (value != null) {
                                  tmpFilters[index].active = value;
                                }
                              });
                            });
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
