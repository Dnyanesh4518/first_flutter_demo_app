import 'package:flutter/material.dart';
import 'Pages/Home.dart';
import 'Pages/Choose_Location.dart';
import 'Pages/Loading.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/home': (context) => Home(),
        '/choose': (context) => Choose_Location(),
        '/': (context) => Loading()
      },
    ));

