import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:kedi_oto_app/ProductDetailPage/Widget/image_container_widget.dart';
import 'package:kedi_oto_app/ProductDetailPage/Widget/product_paragraf_info_widget.dart';
import 'package:kedi_oto_app/ProductDetailPage/Widget/product_title_widget.dart';
import 'package:kedi_oto_app/constant.dart';
import '../Widget/buy_widget.dart';
import '../Widget/shopNameWidget.dart';

class ProductDetailHomePage extends StatefulWidget {
  const ProductDetailHomePage({super.key});

  @override
  State<ProductDetailHomePage> createState() => _ProductDetailHomePageState();
}

class _ProductDetailHomePageState extends State<ProductDetailHomePage> {
  bool isAdminn = admin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Stack(
                children: [
                  Column(
                    children: [
                      ImageContainerWidget(),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          shopLogo(),
                          ShopName(),
                        ],
                      ),
                      const SizedBox(height: 10),
                      ProductTitleWidget(isAdmin: isAdminn),
                      ProductParagrafInfoWidget(isAdmin: isAdminn),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            BuyWidget(isAdmin: isAdminn),
          ],
        ),
      ),
    );
  }

  ClipRRect shopLogo() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(999),
      child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(999),
              boxShadow: [
                BoxShadow(
                    blurStyle: BlurStyle.normal,
                    color: Colors.black,
                    blurRadius: 5,
                    offset: Offset(2, 2),
                    spreadRadius: 5)
              ]),
          child: Image.asset(
            "assets/kediOtoLogo.png",
            fit: BoxFit.cover,
          )),
    );
  }
}
