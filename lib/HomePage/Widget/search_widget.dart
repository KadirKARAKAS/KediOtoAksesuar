import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var urunAramaController = TextEditingController();
    return Container(
      width: size.width,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6), color: Colors.grey.shade300),
      child: TextField(
        controller: urunAramaController,
        decoration: const InputDecoration(
          icon: Padding(
            padding: EdgeInsets.only(left: 5),
            child: Icon(Icons.search, size: 25),
          ),
          hintText: "Ürün arama",
          hintStyle: TextStyle(fontSize: 18),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
