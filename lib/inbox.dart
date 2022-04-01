import 'package:flutter/material.dart';

class inbox extends StatefulWidget {
  const inbox({Key? key}) : super(key: key);

  @override
  State<inbox> createState() => _inboxState();
}

class _inboxState extends State<inbox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.email,
                color: Colors.blue,
                size: 40,
              ),
              const SizedBox(height:10),
              const Text(
                  "Anda tidak memiliki pesan baru",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )
            ],
        ),
      ),
    );
  }
}
