import 'package:flutter/material.dart';
import 'package:kedi_oto_app/AddProductPage/Page/add_product_homePage.dart';
import 'package:kedi_oto_app/HomePage/Widget/products_list_widget.dart';
import 'package:kedi_oto_app/HomePage/Widget/search_widget.dart';
import 'package:kedi_oto_app/topBarWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
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
                    onTap: () async {},
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
