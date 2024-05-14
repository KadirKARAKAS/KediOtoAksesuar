import 'package:flutter/material.dart';
import 'package:kedi_oto_app/constant.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class BuyWidget extends StatelessWidget {
  final bool isAdmin;

  BuyWidget({required this.isAdmin});
  var productTitleChanged = '';

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

  Widget satinAlWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 5, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          productPriceWidget(),
          SizedBox(width: 10),
          InkWell(
            onTap: () {
              _launchURLBrowser();
            },
            child: isAdmin
                ? InkWell(
                    onTap: () {
                      print(productParagrafChanged);
                    },
                    child: Container(
                      width: 135,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.orange.shade400,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(" Güncelle",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 22)),
                      ),
                    ),
                  )
                : Container(
                    width: 135,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.orange.shade400,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text("Satın Al",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 22)),
                    ),
                  ),
          )
        ],
      ),
    );
  }

  Widget productPriceWidget() {
    return isAdmin
        ? Expanded(
            child: TextFormField(
              initialValue: getdataList[geciciIndex]["productPrice"],
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              decoration: InputDecoration(
                labelText: 'Ürün Fiyatı',
              ),
              onChanged: (value) {
                productPriceChanged = value;
                // updatedTitle = updadteParagraf;
              },
              readOnly: !isAdmin,
            ),
          )
        : Text(
            "${getdataList[geciciIndex]["productPrice"]}₺",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          );
  }

  _launchURLBrowser() async {
    var url = Uri.parse(getdataList[geciciIndex]["productLink"]);
    if (await canLaunch(url.toString())) {
      await launch(url.toString());
    } else {
      print("Hata: Bağlantı açılamadı");
    }
  }
}
