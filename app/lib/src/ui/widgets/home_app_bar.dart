import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/src/blocs/movie_list/movie_list_bloc.dart';
import 'package:movieapp/src/blocs/routes/routes_bloc.dart';

class HomeAppBar extends StatefulWidget with PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  _HomeAppBarState createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  String title = "Home";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text("Hello");
    /*
    return BlocListener<RoutesBloc, RoutesState>(
      listener: (context, state) {
        if (state is RoutesRedirect) {
          setState(() {
            title = "MyMovie - " + state.page;
          });
        }
      },
      child: AppBar(
        title: Text(title),
        backgroundColor: Colors.blue,
      ),
    );
    */
  }
}
