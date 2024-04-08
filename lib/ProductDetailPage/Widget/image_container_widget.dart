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
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: getdataList[geciciIndex]["ProductPhotoURL"].length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 0),
        itemBuilder: (context, index) {
          String imageUrl = getdataList[geciciIndex]["ProductPhotoURL"][index];
          return imageContainer(size, imageUrl);
        },
      ),
    );
  }

  Padding imageContainer(Size size, String imageUrl) {
    return Padding(
      padding: const EdgeInsets.only(right: 5, left: 0),
      child: Container(
        width: size.width,
        color: Colors.grey.shade100,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CircularProgressIndicator(
              color: Colors.orange,
            ),
            Image.network(
              imageUrl,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.orange,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
