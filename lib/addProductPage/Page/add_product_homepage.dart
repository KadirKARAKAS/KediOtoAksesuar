import 'package:flutter/material.dart';
import 'package:kedi_oto_aksesuarr/addProductPage/Widget/product_info_widget.dart';
import 'package:kedi_oto_aksesuarr/topBar_Button_widget.dart';

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
                const ProductInfoWidget(),
                const SizedBox(height: 40),
                saveProductButtonWidget()
              ],
            ),
          )
        ],
      ),
    );
  }

  InkWell saveProductButtonWidget() {
    return InkWell(
      onTap: () {
        print("Ürün eklendi");
      },
      child: Container(
        child: Center(
            child: Text(
          "Ürün Ekle",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        )),
        width: 120,
        height: 45,
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(6),
            boxShadow: const [
              BoxShadow(
                  blurRadius: 1, color: Colors.black26, offset: Offset(-1, 1))
            ]),
      ),
    );
  }
}
