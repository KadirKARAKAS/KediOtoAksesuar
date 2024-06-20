import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kedi_oto_app/ProductDetailPage/Page/product_detail_homepage.dart';
import 'package:kedi_oto_app/constant.dart';

class ProductsListWidget extends StatefulWidget {
  const ProductsListWidget({Key? key}) : super(key: key);

  @override
  State<ProductsListWidget> createState() => _ProductsListWidgetState();
}

class _ProductsListWidgetState extends State<ProductsListWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.only(top: 10),
      shrinkWrap: true,
      itemCount: searchflag ? filteredList.length : getdataList.length,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return productListContainerWidget(index);
      },
    );
  }

  InkWell productListContainerWidget(index) {
    return InkWell(
      onTap: () {
        geciciIndex = index;
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ProductDetailHomePage(),
            ));
      },
      child: Stack(
        children: [
          Container(
            height: 235,
            width: 200,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  blurRadius: 3,
                  color: Colors.grey.shade400,
                  offset: Offset(0, 1.5))
            ]),
          ),
          Column(
            children: [
              Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(7),
                        topRight: Radius.circular(7),
                      )),
                  child: Stack(
                    children: [
                      const Center(
                          child: CircularProgressIndicator(
                        color: Colors.orange,
                      )),
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(7),
                          topRight: Radius.circular(7),
                        ),
                        child: SizedBox(
                          width: 200,
                          child: cachedImmage(searchflag
                              ? filteredList[index]["ProductPhotoURL"][0]
                              : getdataList[index]["ProductPhotoURL"][0]),
                        ),
                      )
                    ],
                  )),
              Container(
                width: 200,
                height: 35,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadiusDirectional.only(
                        bottomEnd: Radius.circular(7),
                        bottomStart: Radius.circular(7))),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                            searchflag
                                ? filteredList[index]["productName"]
                                : getdataList[index]["productName"],
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                            overflow: TextOverflow.ellipsis),
                      ),
                      Text(
                        "  ${searchflag ? filteredList[index]["productPrice"] : getdataList[index]["productPrice"]} ₺",
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
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
