import 'package:cached_network_image/cached_network_image.dart';
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
        key: UniqueKey(),
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
        child: cachedImmage(imageUrl),

        // Stack(
        //   alignment: Alignment.center,
        //   children: [
        //     CircularProgressIndicator(
        //       color: Colors.orange,
        //     ),
        //   ],
        // ),
      ),
    );
  }
}

Widget cachedImmage(String resimLinki) {
  return CachedNetworkImage(
    imageUrl: resimLinki,
    imageBuilder: (context, imageProvioder) {
      return Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: imageProvioder, fit: BoxFit.cover),
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
