import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductInfoWidget extends StatelessWidget {
  const ProductInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var productName = TextEditingController();
    var productPrice = TextEditingController();
    var productInfo = TextEditingController();

    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        productNameTextFieldWidget(size, productName),
        const SizedBox(height: 20),
        productInfoTextFieldWidget(size, productInfo),
        const SizedBox(height: 20),
        productPriceTextFieldWidget(size, productPrice),
        const SizedBox(height: 20),
        SizedBox(
          width: size.width,
          height: 305,
          child: ListView.builder(
            padding: EdgeInsets.all(0),
            physics: ScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return imageContainerWidget();
            },
          ),
        )
      ],
    );
  }

  Padding imageContainerWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 3, right: 5),
      child: InkWell(
        onTap: () {
          print("RESİM YÜKLE");
        },
        child: Container(
          width: 200,
          height: 250,
          decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(13),
              boxShadow: const [
                BoxShadow(
                    blurRadius: 2, color: Colors.black26, offset: Offset(-2, 0))
              ]),
          child: const Icon(Icons.image, size: 40),
        ),
      ),
    );
  }

  Container productNameTextFieldWidget(
      Size size, TextEditingController productName) {
    return Container(
      width: size.width,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.grey.shade300,
          boxShadow: const [
            BoxShadow(
                blurRadius: 1, color: Colors.black26, offset: Offset(0, 2))
          ]),
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: TextField(
          controller: productName,
          decoration: const InputDecoration(
            hintText: "Ürün Başlığı Girin...",
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Container productPriceTextFieldWidget(
      Size size, TextEditingController productPrice) {
    return Container(
      width: size.width,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.grey.shade300,
          boxShadow: const [
            BoxShadow(
                blurRadius: 1, color: Colors.black26, offset: Offset(0, 2))
          ]),
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: TextField(
          keyboardType: TextInputType.number,
          controller: productPrice,
          decoration: const InputDecoration(
            hintText: "Ürün Fiyatı Girin...",
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Container productInfoTextFieldWidget(
      Size size, TextEditingController productInfo) {
    return Container(
      width: size.width,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.grey.shade300,
          boxShadow: const [
            BoxShadow(
                blurRadius: 1, color: Colors.black26, offset: Offset(0, 2))
          ]),
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: TextField(
          controller: productInfo,
          decoration: const InputDecoration(
            hintText: "Ürün Açıklaması Girin...",
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
