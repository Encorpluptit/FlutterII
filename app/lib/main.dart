// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
            title: Text(
          'A title',
          style: GoogleFonts.lato(textStyle: const TextStyle(fontSize: 18.0)),
        )),
        body: SingleChildScrollView(
            child: Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 10.0),
                alignment: Alignment.topCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.network(
                            'https://picsum.photos/id/237/200/300')),
                    const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'A title',
                          style: TextStyle(fontFamily: 'Aleo', fontSize: 25.0),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent vehicula enim vitae quam pharetra viverra quis vitae dui. Integer non tincidunt tellus, sit amet laoreet elit. Vestibulum laoreet, metus sed rutrum pellentesque, mauris arcu lobortis sapien, et congue metus sem a neque. Aliquam et eleifend sem, et volutpat ipsum. Phasellus rhoncus leo nec dictum mattis. Vivamus dignissim orci quam, a ultricies dui luctus ut. Ut vitae nisl tellus. Pellentesque justo lacus, feugiat blandit sodales sed, sodales vel ante. Aliquam porttitor ornare turpis commodo varius. Praesent diam dolor, molestie eu tortor et, faucibus tristique erat. Praesent congue risus eu sagittis molestie. Nulla facilisi. Etiam id purus ut felis auctor varius sit amet eu nunc. Ut sodales at magna eu ultrices. Phasellus facilisis tempus odio, at ultricies sapien viverra a.',
                        style: GoogleFonts.lato(
                            textStyle: const TextStyle(fontSize: 18.0)),
                      ),
                    ),
                    SizedBox(
                        height: 300,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Container(
                              width: 175.0,
                              color: Colors.red,
                            ),
                            Container(
                              width: 175.0,
                              color: Colors.blue,
                            ),
                            Container(
                              width: 175.0,
                              color: Colors.green,
                            ),
                            Container(
                              width: 175.0,
                              color: Colors.yellow,
                            ),
                            Container(
                              width: 175,
                              color: Colors.orange,
                            ),
                          ],
                        ))
                  ],
                ))),
      ),
    );
  }
}
