import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kedi_oto_app/constant.dart';

class ProductParagrafInfoWidget extends StatelessWidget {
  final bool isAdmin;

  ProductParagrafInfoWidget({required this.isAdmin});
  String productParagrafChanged = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        height: 120,
        child: SingleChildScrollView(
          child: isAdmin
              ? TextFormField(
                  initialValue: getdataList[geciciIndex]["productInfo"],
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  decoration: InputDecoration(
                    labelText: 'Ürün açıklaması',
                  ),
                  onChanged: (value) {
                    productParagrafChanged = value;
                    updatedTitle = updadteParagraf;
                  },
                  readOnly: !isAdmin,
                )
              : Text(
                  "Ürün açıklaması: ${getdataList[geciciIndex]["productInfo"]}",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                ),
        ),
      ),
    );
  }
}
