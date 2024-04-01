import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductInfoWidget extends StatelessWidget {
  const ProductInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var productName = TextEditingController();
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          width: size.width,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.grey.shade300),
          child: TextField(
            controller: productName,
            decoration: InputDecoration(hintText: "Ürün Başlığı Girin..."),
          ),
        ),
      ],
    );
  }
}
