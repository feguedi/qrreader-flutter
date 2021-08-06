import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:qrreader/src/views/views.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    final ThemeData theme = ThemeData(
      primaryColor: Colors.deepPurple,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.deepPurple,
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR Reader App',
      theme: theme,
      initialRoute: 'reader',
      routes: {
        'reader': (_) => ReaderView(),
        'map': (_) => MapView(),
      },
    );
  }
}
