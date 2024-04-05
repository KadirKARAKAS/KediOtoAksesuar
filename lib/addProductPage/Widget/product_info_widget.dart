import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kedi_oto_aksesuarr/constant.dart';
import 'package:kedi_oto_aksesuarr/test.dart';
import 'package:permission_handler/permission_handler.dart';

class ProductInfoWidget extends StatefulWidget {
  ProductInfoWidget({super.key});

  @override
  State<ProductInfoWidget> createState() => _ProductInfoWidgetState();
}

class _ProductInfoWidgetState extends State<ProductInfoWidget> {
  final ImagePicker picker = ImagePicker();

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
        // catagoriesSelectListviewWidget(size),
        // const SizedBox(height: 20),
        // imageListViewWidget(size),
        imageContainerWidget(),
        FloatingActionButton(
          onPressed: () async {
            // var status = await Permission.storage.status;
            // print(status);
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PermissionPage(),
                ));
          },
        )
      ],
    );
  }

  // SizedBox catagoriesSelectListviewWidget(Size size) {
  SizedBox imageListViewWidget(Size size) {
    return SizedBox(
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
    );
  }

  Padding imageContainerWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 3, right: 5),
      child: InkWell(
        onTap: () async {
          addPhotoFunction();
        },
        child: Container(
          width: 200,
          height: 250,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(13),
            boxShadow: const [
              BoxShadow(
                blurRadius: 2,
                color: Colors.black26,
                offset: Offset(-2, 0),
              )
            ],
          ),
          child: selectedImagePath == ""
              ? const Icon(Icons.image, size: 40)
              : ClipRRect(
                  borderRadius: BorderRadius.circular(41),
                  child: Image.file(
                    File(selectedImagePath),
                    fit: BoxFit.cover,
                  ),
                ),
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

  addPhotoFunction() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        selectedImagePath = image.path;
      });
    }
  }
}
