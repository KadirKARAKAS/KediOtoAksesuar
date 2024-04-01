import 'package:flutter/material.dart';
import 'package:kedi_oto_aksesuarr/topBar_widget.dart';

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
        children: [TopBarWidget(titleText: "Ürün Ekle")],
      ),
    );
  }
}
