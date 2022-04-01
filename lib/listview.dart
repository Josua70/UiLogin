import 'package:flutter/material.dart';

class listview extends StatefulWidget {
  const listview({Key? key}) : super(key: key);

  @override
  State<listview> createState() => _listviewState();
}

class _listviewState extends State<listview> {
  final List bulan = [
    "Januari",
    "Februari",
    "Maret",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Contoh list"),
        ),
        body: Container(
          child: ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(bulan[index], style: TextStyle(fontSize: 16))
                  ),
                );
    },
    itemCount: bulan.length,
    ),
    ),
    );
  }
}
