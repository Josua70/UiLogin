import 'package:flutter/material.dart';

class list2 extends StatefulWidget {
  const list2({Key? key}) : super(key: key);

  @override
  State<list2> createState() => _list2State();
}

class _list2State extends State<list2> {
  final List produk = [
    "Nasi",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text("Produk"),
      ),
      body: Container(
        color: Colors.teal,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children : [
                    Image.asset("assets/nasi.jpg", width: 50, height: 50,),
                    const SizedBox(width: 10,),
                    Text("Nasi", style: TextStyle(fontSize: 20))
                ]
              ),
            ),
            );
          },
          // itemCount: produk.length,
        ),
      ),
    );
  }
}
