import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ShopName extends StatelessWidget {
  const ShopName({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Kedi Oto Aksesuar",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
              ),
              rowWidget(),
            ],
          ),
          Container(
            width: 50,
            height: 50,
            color: Colors.red,
          ),
        ],
      ),
    );
  }

  Row rowWidget() {
    return Row(
      children: [
        SizedBox(
          width: 15,
          height: 15,
          child: Image.asset("assets/star.png"),
        ),
        SizedBox(
          width: 15,
          height: 15,
          child: Image.asset("assets/star.png"),
        ),
        SizedBox(
          width: 15,
          height: 15,
          child: Image.asset("assets/star.png"),
        ),
        SizedBox(
          width: 15,
          height: 15,
          child: Image.asset("assets/star.png"),
        ),
        SizedBox(
          width: 15,
          height: 15,
          child: Image.asset("assets/star.png"),
        ),
      ],
    );
  }
}
