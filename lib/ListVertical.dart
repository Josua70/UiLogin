import 'dart:convert';
import 'dart:async';
import 'dart:html';
import 'package:contoh/Model/ModelListVertical.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListVertical extends StatefulWidget {
  const ListVertical({Key? key}) : super(key: key);

  @override
  State<ListVertical> createState() => _ListVerticalState();
}

class _ListVerticalState extends State<ListVertical> {
  List<Search> dataListApi = [];
  final String apiUrl = "https://fake-movie-database-api.herokuapp.com/api?s=batman";
  Future<ModelListVertical> getListRepository(BuildContext context) async {
    var uri = Uri.parse(apiUrl).replace();
    try{
      final response = await http
          .get(uri, headers: {})
          .timeout(const Duration(seconds: 30));
      if (response.statusCode == HttpStatus.ok){
        print(jsonDecode(response.body));
        return ModelListVertical.fromJson(jsonDecode(response.body));
      }else{
        return ModelListVertical.withError("Gagal load data");
      }
    } on TimeoutException catch (_) {
      return ModelListVertical.withError("Waktu habis, silahkan coba kembali");
    }
  }

  void getModelListVertical(BuildContext) async {
    final response = await getListRepository(context);
    if (response.error == null) {
      setState(() {
        dataListApi = response.search!;
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
            children:[
              const Text('Daftar Vertical', style: TextStyle(fontWeight: FontWeight.bold),),
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
                          Image.network(dataListApi[index].Poster.toString(), width: 70, height: 70,),
                          const SizedBox(height: 8,),
                          Text(dataListApi[index].Title.toString(), style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8, width: 8,),
                          Text(dataListApi[index].Year.toString()),
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
