import 'package:carousel_slider/carousel_slider.dart';
import 'package:contoh/navigatorDrawer.dart';
import 'package:flutter/material.dart';
import '../model/DataBulan.dart';


class navigatorMain extends StatefulWidget {
  const navigatorMain({Key? key}) : super(key: key);

  @override
  _navigatorMainState createState() => _navigatorMainState();
}

class _navigatorMainState extends State<navigatorMain> {
  final List<String> image = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoE6vx8MRRXATZGz9SBD6hF_lbzJEfLcL7Iw&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNRDBn5LH2l1RbTR2o35O1lWTeL36OSMcNFg&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5Bd4E09gNU2JHw8sPA_OsNh0FkH7_sUbPZg&usqp=CAU',
  ];

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

  @override
  void initState() {
    setData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var ukuran = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Navigation Drawer"),
      ),
      drawer: navigatorDrawer(),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              //--------------- CarouselSlider Horizontal ---------------------
              Container(
                  margin: const EdgeInsets.only(top: 16),
                  height: 220,
                  child: CarouselSlider.builder(
                    itemCount: image.length,
                    itemBuilder: (context, index, _) {
                      return Container(
                          width: ukuran.width,
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                offset: const Offset(3, 3),
                                color: Colors.grey.shade400)
                          ]),
                          child: GestureDetector(
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                    width: ukuran.width,
                                    height: ukuran.height,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(5),
                                            topRight: Radius.circular(5)),
                                        image: DecorationImage(
                                          image : NetworkImage(image[index]),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            onTap: () async {},
                          )
                      );
                    },
                    options: CarouselOptions(
                      onPageChanged: (index, reason) async {
                      },
                      height: 180,
                      enableInfiniteScroll: true,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 5),
                      autoPlayAnimationDuration: const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      pauseAutoPlayOnTouch: true,
                      aspectRatio: 2.0,
                    ),
                  )
              ),

              //--------------- ListView Horizontal ---------------------
              const SizedBox(height: 16,),
              const Text("Data Produk Horizontal", style: TextStyle(fontWeight: FontWeight.bold),),
              const SizedBox(height: 16,),
              SizedBox(
                  width: double.infinity,
                  height: 180,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: dataBulan.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          print("data : ${dataBulan[index].namaBulan}");
                        },
                        child: Container(
                            width: 150,
                            alignment: Alignment.center,
                            child: Card(
                              child: Container(
                                width: double.infinity,
                                margin: const EdgeInsets.all(12),
                                child: Column(
                                  children: [
                                    Image.network(dataBulan[index].image, width: 70, height: 70,),
                                    const SizedBox(height: 16,),
                                    Text(dataBulan[index].namaBulan, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                    const SizedBox(height: 8,),
                                    Text(dataBulan[index].descriptonBulan),
                                  ],
                                ),
                              ),
                            )
                        ),
                      );
                    },
                  )
              ),

              //-------------------- ListView Vertical ---------------------
              const SizedBox(height: 16,),
              const Text("Data Produk Vertical", style: TextStyle(fontWeight: FontWeight.bold),),
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
                          Image.network(dataBulan[index].image, width: 70, height: 70,),
                          const SizedBox(width: 12,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(dataBulan[index].namaBulan, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 8,),
                              // Text(dataBulan[index].descriptonBulan),
                              Text(dataBulan[index].descriptonBulan)
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: dataBulan.length,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
