import 'package:flutter/material.dart';

class HomeAppBar extends StatefulWidget with PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  _HomeAppBarState createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Icon(
        Icons.menu,
      ),
      title: const Text('MyMovie'),
      backgroundColor: Colors.blue,
    );
  }
}
