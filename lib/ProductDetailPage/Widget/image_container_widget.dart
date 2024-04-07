import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kedi_oto_app/constant.dart';

class ImageContainerWidget extends StatelessWidget {
  const ImageContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
        padding: const EdgeInsets.all(0),
        child: Container(
          height: 500,
          width: size.width,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 2,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return deneme(0);
            },
          ),
        ));
  }

  Container imageContainer(Size size, int i) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // CircularProgressIndicator(
          //   color: Colors.orange,
          // ),
          Image.network(
            getdataList[geciciIndex]["ProductPhotoURL"][0],
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }

  Padding deneme(int i) {
    return Padding(
      padding: const EdgeInsets.only(right: 7),
      child: Container(
        child: Image.network(
          getdataList[geciciIndex]["ProductPhotoURL"][0],
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
