import 'package:contoh/login.dart';
import 'package:contoh/ListView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/logo gojek.png", width: 70, height: 70,),
            const SizedBox(height: 1,),
            const Text("Aplikasi Baru",
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 20
              ),
            ),
            const SizedBox(height: 16,),
            const Text("Silahkan Register",
                style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20
            ),
      ),
            const SizedBox(height: 12,),
            TextFormField(
              decoration: const InputDecoration(
                  labelText: "Email",
                  hintText: "contoh : indocyber@gmail.com",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  borderSide: BorderSide(
                    color: Colors.blue,
                        width: 2.0,
                  ),

                ),
              ),
            ),
            const SizedBox(height: 12,),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Nama",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),

    enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(
            color: Colors.blue,
            width: 2.0,
                    ),
                ),
              ),
            ),
            const SizedBox(height: 12,),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                  labelText: "password",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                ),
              ),
            ),



            const SizedBox(height: 36,),
            ElevatedButton(
                onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>screen3()));
                },
                child: Text("Register")
            ),
            const SizedBox(height: 18,),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => login()));
                },
                child: Text("Sudah Punya Akun")

            )

          ],
        ),
      ),
    );
  }
}
