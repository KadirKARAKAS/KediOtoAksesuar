import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kedi_oto_app/constant.dart';

class ProductTitleWidget extends StatelessWidget {
  final bool isAdmin;

  ProductTitleWidget({required this.isAdmin});
  String productNameChanged = '';

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: isAdmin
          ? TextFormField(
              initialValue: getdataList[geciciIndex]["productName"],
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
              decoration: InputDecoration(
                labelText: 'Ürün başlığı',
              ),
              onChanged: (value) {
                productNameChanged = value;
                updatedTitle = productNameChanged;
              },
              readOnly: !isAdmin,
            )
          : Text(
              getdataList[geciciIndex]["productName"],
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
              overflow: TextOverflow.ellipsis,
            ),
    );
  }
}
