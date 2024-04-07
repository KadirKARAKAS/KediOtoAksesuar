import 'package:flutter/cupertino.dart';
import 'package:kedi_oto_app/constant.dart';

class ProductTitleWidget extends StatelessWidget {
  const ProductTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        getdataList[geciciIndex]["productName"],
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
