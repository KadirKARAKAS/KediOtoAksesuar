import 'package:flutter/material.dart';
import 'package:kedi_oto_app/constant.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var urunAramaController = TextEditingController();
    return Container(
      width: size.width,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6), color: Colors.grey.shade300),
      child: TextField(
        controller: urunAramaController,
        decoration: const InputDecoration(
          icon: Padding(
            padding: EdgeInsets.only(left: 5),
            child: Icon(Icons.search, size: 25),
          ),
          hintText: "Ürün arama",
          hintStyle: TextStyle(fontSize: 18),
          border: InputBorder.none,
        ),
        onSubmitted: (String value) {
          if (value == "kediotoadmin") {
            admin = true;
          } else {
            admin = false;
          }
          getdataList = tempList;
          for (var i = 0; i < getdataList.length; i++) {
            String productName = getdataList[i]["productName"].toLowerCase();
            // Eğer ürün adı arama metnini içeriyorsa, filtreye ekleyelim
            if (productName.contains(value)) {
              filteredList.add(getdataList[i]);
            }
          }
          setState(() {
            getdataList = filteredList;
          });
          print('Girilen metin: $value , $admin');
        },
      ),
    );
  }
}
