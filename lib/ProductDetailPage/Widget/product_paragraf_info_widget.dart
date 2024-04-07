import 'package:flutter/cupertino.dart';
import 'package:kedi_oto_app/constant.dart';

class ProductParagrafInfoWidget extends StatelessWidget {
  const ProductParagrafInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Text(
          getdataList[geciciIndex]["productInfo"],
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
        ));
  }
}
