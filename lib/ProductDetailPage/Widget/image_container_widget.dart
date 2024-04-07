import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kedi_oto_app/constant.dart';

class ImageContainerWidget extends StatelessWidget {
  const ImageContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 500,
      width: size.width,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: getdataList[geciciIndex]["ProductPhotoURL"].length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 0),
        itemBuilder: (context, index) {
          return imageContainer(size, 0);
        },
      ),
    );
  }

  Padding imageContainer(Size size, int i) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        child: Stack(
          alignment: Alignment.center,
          children: [
            CircularProgressIndicator(
              color: Colors.orange,
            ),
            Image.network(
              getdataList[geciciIndex]["ProductPhotoURL"][0],
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }

  Padding deneme(int i) {
    return Padding(
        padding: const EdgeInsets.only(right: 7),
        child: Stack(
          children: [
            Container(
              child: Image.network(
                getdataList[geciciIndex]["ProductPhotoURL"][0],
                fit: BoxFit.cover,
              ),
            ),
          ],
        ));
  }
}
