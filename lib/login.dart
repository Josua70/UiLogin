import 'package:contoh/bottomNavigation.dart';
import 'package:contoh/register.dart';
import 'package:contoh/screen3.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/logo gojek.png", width: 150, height: 150,),
            const SizedBox(height: 1,),
            const Text("Aplikasi Baru",
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20
              ),
            ),
            const SizedBox(height: 16,),
            const Text("Silahkan Login"),
            const SizedBox(height: 16,),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
                    hintText: "contoh : indocyber@gmail.com",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2.0,
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
            const SizedBox(height: 16,),
            TextFormField(
              controller: passwordController,
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
                   Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigationScreen()));
                  print("email => ${emailController.text}");
                  print("password => ${passwordController.text}");
                },
                child: Text("Login")

            ),
            const SizedBox(height: 18,),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => register()));
                  print("email => ${emailController.text}");
                  print("password => ${passwordController.text}");
                },
                child: Text("Register")

            )

          ],
        ),
      ),
    );
  }
}
