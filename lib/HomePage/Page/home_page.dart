import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kedi_oto_app/AddProductPage/Page/add_product_homePage.dart';
import 'package:kedi_oto_app/HomePage/Widget/products_list_widget.dart';
import 'package:kedi_oto_app/HomePage/Widget/search_widget.dart';
import 'package:kedi_oto_app/constant.dart';
import 'package:kedi_oto_app/topBarWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("Products");

    final querySnapshot = await userRef.get();
    getdataList.clear();

    querySnapshot.docs.forEach((doc) {
      docIDList.add(doc.id);
      getdataList.add(doc.data());
    });
    print("YENİ VERİLER ÇEKİLDİ!");

    setState(() {});
  }

  Widget build(BuildContext context) {
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
                  SearchWidget(),
                  ProductsListWidget(),
                  InkWell(
                    onTap: () async {
                      print(getdataList.length);
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
}
