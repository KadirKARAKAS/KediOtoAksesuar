import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kedi_oto_app/constant.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => TestPageState();
}

class TestPageState extends State<TestPage> {
  List<String> getdatalist = [
    'Product 1',
    'Product 2',
    'Product 3',
    'Product 4',
    'Product 5',
    'Product 6',
    'Product 7',
    'Product 8',
    'Product 9',
    'Product 10',
    'Product 11',
    'Product 12'
  ];
  List<String> filteredList = [];
  String searchQuery = '';
  bool circleBool = false;

  @override
  void initState() {
    super.initState();
    filteredList = getdatalist; // Başlangıçta tüm ürünleri göster
  }

  void updateSearchQuery(String newQuery) {
    setState(() {
      searchQuery = newQuery;
      filteredList = getdatalist
          .where((product) =>
              product.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TEST PAGE"),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search Products',
                border: OutlineInputBorder(),
              ),
              onChanged: updateSearchQuery,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Expanded(
              child: ListView.builder(
                itemCount: filteredList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(filteredList[index]),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget loadingCircle() {
    if (circleBool) {
      return Center(
        child: SizedBox(
          height: 50,
          width: 50,
          child: CircularProgressIndicator(
            backgroundColor: Colors.orange,
            strokeWidth: 5,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
        ),
      );
    } else {
      return SizedBox.shrink();
    }
  }
}
