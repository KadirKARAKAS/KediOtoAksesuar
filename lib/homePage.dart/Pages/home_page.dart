import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kedi_oto_aksesuarr/addProductPage/Page/add_product_homepage.dart';
import 'package:kedi_oto_aksesuarr/homePage.dart/Widget/catagories_widget.dart';
import 'package:kedi_oto_aksesuarr/homePage.dart/Widget/search_container_widget.dart';
import 'package:kedi_oto_aksesuarr/topBar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  TopBarWidget(titleText: "Kedi Oto Aksesuar"),
                  const SizedBox(height: 5),
                  SearchContainerWidget(),
                  const SizedBox(height: 10),
                  CatagoriesWidget(),
                  const SizedBox(height: 10),
                  FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddProductHomePage(),
                          ));
                    },
                    backgroundColor: Colors.red,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
