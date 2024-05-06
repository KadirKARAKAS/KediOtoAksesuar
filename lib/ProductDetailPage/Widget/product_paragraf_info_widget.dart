import 'package:flutter/cupertino.dart';
import 'package:kedi_oto_app/constant.dart';

class ProductParagrafInfoWidget extends StatelessWidget {
  const ProductParagrafInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        height: 120,
        child: SingleChildScrollView(
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Ürün açıklaması: ${getdataList[geciciIndex]["productInfo"]}",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
              )),
        ),
      ),
    );
  }
}
