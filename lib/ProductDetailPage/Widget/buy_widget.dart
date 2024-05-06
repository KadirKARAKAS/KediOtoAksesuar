import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuyWidget extends StatelessWidget {
  const BuyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: size.width,
          height: 70,
          color: Colors.grey.shade300,
        ),
        satinAlWidget()
      ],
    );
  }

  Container satinAlWidget() {
    return Container(
      width: 135,
      height: 45,
      color: Colors.orange.shade400,
    );
  }
}
