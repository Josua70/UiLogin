import 'dart:async';
import 'dart:convert';
import 'dart:html';
import 'package:contoh/Model/ListModel.dart';
import 'package:flutter/material.dart';
import 'Model/DataBulan.dart';
import 'package:http/http.dart' as http;

class gridview extends StatefulWidget {
  const gridview({Key? key}) : super(key: key);

  @override
  State<gridview> createState() => _gridviewState();
}

class _gridviewState extends State<gridview> {
  @override

  List<DataBulan> dataBulan = [];

  void setData() {
    dataBulan.add(DataBulan(namaBulan: "Produk 1", descriptonBulan: "Stop Kontak", image: "https://images.tokopedia.net/img/cache/300-square/VqbcmM/2021/7/9/75694678-7783-4368-a3a9-be995260e33c.png.webp?ect=4g"));
    dataBulan.add(DataBulan(namaBulan: "Produk 2", descriptonBulan: "Tissue", image: "https://images.tokopedia.net/img/cache/300-square/VqbcmM/2022/3/2/876b36a4-3043-4083-8633-30a08cbdee61.png.webp?ect=4g"));
    dataBulan.add(DataBulan(namaBulan: "Produk 3", descriptonBulan: "Earphone", image: "https://images.tokopedia.net/img/cache/300-square/attachment/2020/5/3/15885018986662/15885018986662_a51a492a-9c1a-4a53-97fa-08cec21fc5ec.png.webp?ect=4g"));
    dataBulan.add(DataBulan(namaBulan: "Produk 4", descriptonBulan: "Power Bank", image: "https://images.tokopedia.net/img/cache/300-square/product-1/2020/9/11/85364116/85364116_ee5b7911-f37d-4ece-b042-d04ed6b9df7e_1000_1000.webp?ect=4g"));
    dataBulan.add(DataBulan(namaBulan: "Produk 5", descriptonBulan: "Casing", image: "https://images.tokopedia.net/img/cache/700/hDjmkQ/2021/7/24/7378427c-7368-4190-b05b-12f19ed6611b.jpg.webp?ect=4g"));
    dataBulan.add(DataBulan(namaBulan: "Produk 6", descriptonBulan: "Kantong Plastik", image: "https://images.tokopedia.net/img/cache/200-square/VqbcmM/2021/1/23/9a61880b-4471-4ec3-a8d1-0127eec62645.jpg.webp?ect=4g"));
    dataBulan.add(DataBulan(namaBulan: "Produk 7", descriptonBulan: "Baju", image: "https://images.tokopedia.net/img/cache/200-square/VqbcmM/2022/1/30/0d65ea93-a63c-4576-9b7c-a19ae5bd4c88.jpg.webp?ect=4g"));
    dataBulan.add(DataBulan(namaBulan: "Produk 8", descriptonBulan: "Kaos Kaki", image: "https://images.tokopedia.net/img/cache/200-square/product-1/2020/7/21/9349632/9349632_520a819a-bfd7-4780-b4c3-20029e51063c_1080_1080.webp?ect=4g"));
    dataBulan.add(DataBulan(namaBulan: "Produk 9", descriptonBulan: "Sunlight", image: "https://images.tokopedia.net/img/cache/200-square/VqbcmM/2021/5/31/8ac36e37-d991-4997-82a7-e5eef677243e.jpg.webp?ect=4g"));
  }

  List<Data> dataListApi = [];
  final String apiUrl = "https://reqres.in/api/users?per_page=15";

  Future<ListModel> getListRepository(BuildContext context) async {
    var uri = Uri.parse(apiUrl).replace();
    try {
      final response = await http
          .get(uri, headers: {})
          .timeout(const Duration(seconds: 30));
      if (response.statusCode == HttpStatus.ok){
        print(jsonDecode(response.body));
        return ListModel.FromJson(jsonDecode(response.body));
      }else{
        return ListModel.withError("Gagal load data");
      }
    } on TimeoutException catch (_) {
      return ListModel.withError("Waktu habis, silahkan coba kembali");
    }
  }

  void getListViewModel(BuildContext) async {
    final response = await getListRepository(context);
    if (response.error == null) {
      setState(() {
        dataListApi = response.data!;
      });
    } else{
      print(response.error.toString());
    }
  }

  @override
  void initState() {
    getListViewModel(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contoh GridView"),
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Data Gridview", style: TextStyle(fontWeight: FontWeight.bold),),
              const SizedBox(height: 16,),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: dataListApi.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: MediaQuery.of(context).orientation ==
                      Orientation.landscape ? 3: 2,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                  childAspectRatio: (1 / 1),
                ),
                itemBuilder: (context,index,) {
                  return InkWell(
                    onTap: () {
                      print("data : ${dataBulan[index].namaBulan}");
                    },
                    child: Container(
                        alignment: Alignment.center,
                        child: Card(
                          child: Container(
                            width: double.infinity,
                            margin: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Image.network(dataListApi[index].avatar.toString(), width: 70, height: 70,),
                                const SizedBox(height: 8,),
                                Text(dataListApi[index].firstName.toString(), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                const SizedBox(height: 8,),
                                Text(dataListApi[index].email.toString()),
                              ],
                            ),
                          ),
                        )
                    ),
                  );
                },
              )

            ],
          ),
        ),
      ),
    );
  }
}
