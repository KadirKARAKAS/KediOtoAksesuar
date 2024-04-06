import 'package:flutter/material.dart';
import 'package:kedi_oto_app/AddProductPage/Page/add_product_homePage.dart';
import 'package:kedi_oto_app/HomePage/Widget/search_widget.dart';
import 'package:kedi_oto_app/testPage.dart';
import 'package:kedi_oto_app/topBarWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20),
          TopBarWidget(titleText: "Kedi Oto Aksesuar"),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SizedBox(height: 5),
                SearchWidget(),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TestPage(),
                        ));
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.red,
                  ),
                )
              ],
            ),
          )
        ],
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
