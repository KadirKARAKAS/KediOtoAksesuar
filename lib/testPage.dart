import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kedi_oto_app/constant.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TEST PAGE"),
      ),
      body: Column(
        children: [
          // print(getdataList[geciciIndex]["ProductPhotoURL"]);
          // ListView.builder(
          //   itemBuilder: (context, index) {},
          // ),
          Container(
              width: 150,
              height: 200,
              color: Colors.red,
              child: cachedImage(
                  "https://firebasestorage.googleapis.com/v0/b/aksesuar-kedi-oto.appspot.com/o/ProductPhotos%2F1000014347.jpg?alt=media&token=f5b06ef1-5ff4-42cb-a60b-0b8a01385fc9")),
          Container(
            width: 150,
            height: 200,
            color: Colors.red,
            child: Image.network(
                getdataList[geciciIndex]["ProductPhotoURL"][1].toString()),
          ),
          Container(
            width: 150,
            height: 200,
            color: Colors.red,
            child: Image.network(
                getdataList[geciciIndex]["ProductPhotoURL"][2].toString()),
          ),
        ],
      ),
    );
  }
}

Widget cachedImage(String resimLinki) {
  return CachedNetworkImage(
    imageUrl: resimLinki,
    imageBuilder: (context, imageProvioder) {
      return Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: imageProvioder, fit: BoxFit.fill),
        ),
      );
    },
    placeholder: (context, url) => Container(
      height: 250,
      width: 164,
      child: Center(
        child: CircularProgressIndicator(
          color: Colors.blue,
        ),
      ),
    ),
    errorWidget: (context, url, error) => Icon(Icons.error),
  );
}
