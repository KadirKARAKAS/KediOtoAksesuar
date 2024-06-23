import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kedi_oto_app/AddProductPage/Page/add_product_homePage.dart';
import 'package:kedi_oto_app/HomePage/Widget/products_list_widget.dart';
import 'package:kedi_oto_app/constant.dart';
import 'package:kedi_oto_app/testpage.dart';
import 'package:kedi_oto_app/topBarWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var urunAramaController = TextEditingController();

  @override
  void initState() {
    print("KESİT1");
    super.initState();
    _refreshData();
  }

  Future<void> _refreshData() async {
    print("KESİT2");

    final userRef = FirebaseFirestore.instance
        .collection("Users")
        .doc("IQX8DBt1HaXXg6qdBIfMS0OLsEe2")
        .collection("Products");

    final querySnapshot = await userRef.get();
    getdataList.clear();
    tempList.clear;
    querySnapshot.docs.forEach((doc) {
      docIDList.add(doc.id);
      getdataList.add(doc.data());
      tempList.add(doc.data());
    });
    print("YENİ VERİLER ÇEKİLDİ!");

    setState(() {});
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            TopBarWidget(titleText: "Kedi Oto Aksesuar"),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  SizedBox(height: 5),
                  searchh(size),
                  ProductsListWidget(),
                  InkWell(
                    onTap: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TestPage(),
                          ));
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddProductHomePage(),
              ));
        },
        backgroundColor: Colors.red,
      ),
    );
  }

  Container searchh(Size size) {
    return Container(
      width: size.width,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6), color: Colors.grey.shade300),
      child: TextField(
        controller: urunAramaController,
        decoration: const InputDecoration(
          icon: Padding(
            padding: EdgeInsets.only(left: 5),
            child: Icon(Icons.search, size: 25),
          ),
          hintText: "Ürün arama",
          hintStyle: TextStyle(fontSize: 18),
          border: InputBorder.none,
        ),
        onSubmitted: (String value) {
          getdataList = tempList;
          filteredList.clear();
          for (var i = 0; i < getdataList.length; i++) {
            String productName = getdataList[i]["productName"].toLowerCase();
            // Eğer ürün adı arama metnini içeriyorsa, filtreye ekleyelim
            if (productName.contains(value)) {
              filteredList.add(getdataList[i]);
            }
          }
          setState(() {
            getdataList = filteredList;
          });
          print('getDataList : $getdataList');
          print('filteredList : $filteredList');

          print('Girilen metin: $value , $admin');
        },
      ),
    );
  }
}
