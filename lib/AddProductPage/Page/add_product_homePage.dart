import 'package:flutter/material.dart';
import 'package:kedi_oto_app/AddProductPage/Widget/product_info_widget.dart';
import 'package:kedi_oto_app/constant.dart';
import 'package:kedi_oto_app/topBarButtonWidget.dart';

class AddProductHomePage extends StatefulWidget {
  const AddProductHomePage({super.key});

  @override
  State<AddProductHomePage> createState() => _AddProductHomePageState();
}

class _AddProductHomePageState extends State<AddProductHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 18),
          const TopBarButtonWidget(titleText: "Ürün Ekle"),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 30),
                ProductInfoWidget(),
                const SizedBox(height: 40),
              ],
            ),
          )
        ],
      ),
    );
  }
}
