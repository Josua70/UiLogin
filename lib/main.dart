import 'package:contoh/akun.dart';
import 'package:contoh/bottomNavigation.dart';
import 'package:contoh/gridview.dart';
import 'package:contoh/navigatorDrawer.dart';
import 'package:contoh/navigator_main.dart';
import 'package:contoh/ListView.dart';
import 'package:contoh/list2.dart';
import 'package:contoh/listview.dart';
import 'package:contoh/login.dart';
import 'package:contoh/register.dart';
import 'package:contoh/stack.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const gridview(),
    );
  }
}
