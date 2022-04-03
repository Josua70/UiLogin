//model dari generate

import 'dart:convert';
import 'dart:async';
import 'dart:html';
import 'package:contoh/Model/List.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class List1 extends StatefulWidget {
  const List1({Key? key}) : super(key: key);

  @override
  State<List1> createState() => _List1State();
}

class _List1State extends State<List1> {
  List<Data> dataListApi = [];
  final String apiUrl = "https://reqres.in/api/users?per_page=15";
  Future<ListModelGenerate> getListRepository(BuildContext context) async {
    var uri = Uri.parse(apiUrl).replace();
    try{
      final response = await http
          .get(uri, headers: {})
          .timeout(const Duration(seconds: 30));
      if (response.statusCode == HttpStatus.ok){
        print(jsonDecode(response.body));
        return ListModelGenerate.fromJson(jsonDecode(response.body));
      }else{
        return ListModelGenerate.withError("Gagal load data");
      }
    } on TimeoutException catch (_) {
      return ListModelGenerate.withError("Waktu habis, silahkan coba kembali");
    }
  }

  void getModelListVertical(BuildContext) async {
    final response = await getListRepository(context);
    if (response.error == null) {
      setState(() {
        dataListApi = response.data!;
      });
    }else{
      print(response.error.toString());
    }
  }
  @override
  void initState(){
    getModelListVertical(context);
    super.initState();
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('List Vertical'),
        ),
        body: Container(
          margin: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Daftar Vertical',
                  style: TextStyle(fontWeight: FontWeight.bold),),
                const SizedBox(height: 16,),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Card(
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Image.network(
                              dataListApi[index].avatar.toString(), width: 70,
                              height: 70,),
                            const SizedBox(height: 8,),
                            Text(dataListApi[index].firstName.toString(),
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 8,),
                            Text(dataListApi[index].email.toString()),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: dataListApi.length,
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
