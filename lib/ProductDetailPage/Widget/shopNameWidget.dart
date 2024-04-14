import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ShopName extends StatelessWidget {
  const ShopName({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Kedi Oto Aksesuar",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
          ),
          Row(
            children: [
              Container(
                width: 15,
                height: 15,
                child: Image.asset("assets/star.png"),
              ),
              Container(
                width: 15,
                height: 15,
                child: Image.asset("assets/star.png"),
              ),
              Container(
                width: 15,
                height: 15,
                child: Image.asset("assets/star.png"),
              ),
              Container(
                width: 15,
                height: 15,
                child: Image.asset("assets/star.png"),
              ),
              Container(
                width: 15,
                height: 15,
                child: Image.asset("assets/star.png"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
