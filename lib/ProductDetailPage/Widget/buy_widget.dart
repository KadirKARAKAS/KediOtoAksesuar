import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kedi_oto_app/constant.dart';

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

  Padding satinAlWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 5, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          productPriceWidget(),
          SizedBox(width: 10),
          Container(
            width: 135,
            height: 45,
            child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Satın Al",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 22),
                )),
            decoration: BoxDecoration(
                color: Colors.orange.shade400,
                borderRadius: BorderRadius.circular(10)),
          ),
        ],
      ),
    );
  }

  Text productPriceWidget() {
    return Text(
      "${getdataList[geciciIndex]["productPrice"]}₺",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
    );
  }
}
