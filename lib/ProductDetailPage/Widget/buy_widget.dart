import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kedi_oto_app/HomePage/Page/home_page.dart';
import 'package:kedi_oto_app/constant.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class BuyWidget extends StatelessWidget {
  final bool isAdmin;

  BuyWidget({required this.isAdmin});

  @override
  Widget build(BuildContext context) {
    return satinAlWidget(context);
  }

  Widget satinAlWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 7, left: 7, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          productPriceWidget(),
          SizedBox(width: 10),
          InkWell(
            onTap: () {
              _launchURLBrowser(context);
            },
            child: isAdmin
                ? InkWell(
                    onTap: () async {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Ürün Kaydet'),
                            content: const SingleChildScrollView(
                              child: Text(
                                  'Ürünü güncellemek veya silmek için lütfen seçim yapınız.'),
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Sil'),
                                onPressed: () {
                                  print("Ürün Silindi");
                                  deleteProduct();
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HomePage(),
                                      ),
                                      (route) => false);
                                },
                              ),
                              TextButton(
                                child: const Text('Güncelle'),
                                onPressed: () {
                                  print("Ürün güncellendi");
                                  updateProduct({
                                    "productName": productTitleChanged,
                                    "productInfo": productParagrafChanged,
                                    "productPrice": productPriceChanged,
                                  });
                                  print(
                                      "$productTitleChanged,$productParagrafChanged,$productPriceChanged");

                                  productTitleChanged = "";
                                  productParagrafChanged = "";
                                  productPriceChanged = "";

                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HomePage(),
                                      ),
                                      (route) => false);
                                },
                              ),
                            ],
                          );
                        },
                      );
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
              },
              readOnly: !isAdmin,
            ),
          )
        : Text(
            "${getdataList[geciciIndex]["productPrice"]}₺",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          );
  }

  _launchURLBrowser(BuildContext context) async {
    var url = Uri.parse(getdataList[geciciIndex]["productLink"]);

    try {
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        _showErrorDialog(context);
      }
    } catch (e) {
      _showErrorDialog(context);
    }
  }

  void _showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Hata'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Ürün linki bulunamadı.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Tamam'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> updateProduct(Map<String, dynamic> newData) async {
    try {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc("IQX8DBt1HaXXg6qdBIfMS0OLsEe2")
          .collection("Products")
          .doc(getdataList[geciciIndex]["docId"])
          .update(newData);

      print('Ürün güncellendi.');
    } catch (e) {
      print('Hata oluştu: $e');
    }
  }

  Map<String, dynamic> newData = {
    "productName": productTitleChanged,
    "productInfo": productParagrafChanged,
    "productPrice": productPriceChanged,
  };

  Future<void> deleteProduct() async {
    try {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc("IQX8DBt1HaXXg6qdBIfMS0OLsEe2")
          .collection("Products")
          .doc(getdataList[geciciIndex]["docId"])
          .delete();

      print('Ürün silindi.');
    } catch (e) {
      print('Hata oluştu: $e');
    }
  }
}
