import 'package:flutter/material.dart';

class stack extends StatefulWidget {
  const stack({Key? key}) : super(key: key);

  @override
  State<stack> createState() => _stackState();
}

class _stackState extends State<stack> {

  var date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYeq34YyHz95H45yULuS5ZZCHDl1-XtaZfWg&usqp=CAUU'),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Positioned(
            right: 40.0,
            top: 100.0,
            child: Text(date.hour.toString() + ':' + date.minute.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 45.0)),
          ),
          const Positioned(
            right: 40.0,
            top: 150.0,
            child: Text("Stack Widget",
                style: TextStyle(color: Colors.white, fontSize: 16.0)),
          ),
          Positioned(
            bottom: 48.0,
            left: 10.0,
            right: 10.0,
            child: Card(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              color: Colors.greenAccent,

              child: Column(
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "Quotes",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 0, left: 16.0, right: 16.0, bottom: 8.0),
                    child: Text(
                        "There is no right or wrong in this debate. It is simply a matter of perspective, and it is not my place to influence the evolution of the superhuman role"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 8.0, left: 16.0, right: 16.0, bottom: 32.0),
                    child: Text("Dr. Stephen Strange"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
