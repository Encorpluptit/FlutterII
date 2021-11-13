import 'package:flutter/material.dart';
import 'package:movieapp/src/blocs/provider.dart';
import 'package:movieapp/src/blocs/routes/routes_bloc.dart';
import 'package:movieapp/src/ui/screens/account_screen.dart';

import '../screens/movie_list_screen.dart';

class NavigationRouteInterface {
  final Icon icon;
  final String label;
  final Widget widget;
  const NavigationRouteInterface(this.icon, this.label, this.widget);
}

const List<NavigationRouteInterface> navigationRoutes = [
  NavigationRouteInterface(Icon(Icons.home), "Home", MovieListScreen()),
  NavigationRouteInterface(Icon(Icons.home), "Search", MovieListScreen()),
  NavigationRouteInterface(
      Icon(Icons.account_circle), "Account", AccountScreen()),
];

class MainRoutes extends StatefulWidget {
  const MainRoutes({Key? key}) : super(key: key);

  @override
  HomeMainRouteState createState() => HomeMainRouteState();
}

class HomeMainRouteState extends State<MainRoutes> {
  int _selectedIndex = 0;
  RoutesBloc bloc = Provider.getBloc<RoutesBloc>() as RoutesBloc;

  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) {
    bloc.dispatch(RoutesRedirectEvent(navigationRoutes[index].label));
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: navigationRoutes.map<BottomNavigationBarItem>((route) {
            return (BottomNavigationBarItem(
              icon: route.icon,
              label: route.label,
            ));
          }).toList(),
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          onTap: _onItemTapped,
        ),
        body: Center(child: navigationRoutes.elementAt(_selectedIndex).widget));
  }
}
