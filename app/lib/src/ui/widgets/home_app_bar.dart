import 'package:flutter/material.dart';
import 'package:movieapp/src/blocs/provider.dart';
import 'package:movieapp/src/blocs/routes/routes_bloc.dart';
import 'package:movieapp/src/ui/bloc/bloc_builder.dart';
import 'package:movieapp/src/ui/routes/main_routes.dart';

class HomeAppBar extends StatefulWidget with PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  _HomeAppBarState createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  String title = "MyMovie";
  RoutesBloc bloc = Provider.getBloc<RoutesBloc>() as RoutesBloc;

  @override
  void initState() {
    super.initState();
    bloc.dispatch(RoutesRedirectEvent(navigationRoutes[0].label));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RoutesBloc, RoutesState>(
      bloc: bloc,
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
  }
}
