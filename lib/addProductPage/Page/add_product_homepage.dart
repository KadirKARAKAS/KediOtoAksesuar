import 'package:flutter/material.dart';
import 'package:kedi_oto_aksesuarr/addProductPage/Widget/product_info_widget.dart';
import 'package:kedi_oto_aksesuarr/topBar_widget.dart';

class AddProductHomePage extends StatefulWidget {
  const AddProductHomePage({super.key});

  @override
  State<AddProductHomePage> createState() => _AddProductHomePageState();
}

class _AddProductHomePageState extends State<AddProductHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          SizedBox(height: 18),
          TopBarWidget(titleText: "Ürün Ekle"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [SizedBox(height: 30), ProductInfoWidget()],
            ),
          )
        ],
      ),
    );
  }
}
