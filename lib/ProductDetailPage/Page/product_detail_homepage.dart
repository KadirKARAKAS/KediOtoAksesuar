import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kedi_oto_app/ProductDetailPage/Widget/image_container_widget.dart';
import 'package:kedi_oto_app/ProductDetailPage/Widget/product_paragraf_info_widget.dart';
import 'package:kedi_oto_app/ProductDetailPage/Widget/product_title_widget.dart';
import 'package:kedi_oto_app/testPage.dart';
import 'package:kedi_oto_app/topBarButtonWidget.dart';

class ProductDetailHomePage extends StatefulWidget {
  const ProductDetailHomePage({super.key});

  @override
  State<ProductDetailHomePage> createState() => _ProductDetailHomePageState();
}

class _ProductDetailHomePageState extends State<ProductDetailHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            TopBarButtonWidget(titleText: ""),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  ImageContainerWidget(),
                  SizedBox(height: 5),
                  ProductTitleWidget(),
                  ProductParagrafInfoWidget(),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TestPage(),
                            ));
                      },
                      child: Text("BAS BANA"))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
