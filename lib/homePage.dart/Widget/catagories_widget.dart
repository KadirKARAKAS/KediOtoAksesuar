import 'package:flutter/material.dart';

class CatagoriesWidget extends StatelessWidget {
  const CatagoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: 35,
      child: ListView.builder(
        physics: ScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return catagoriesContainer(index);
        },
      ),
    );
  }

  Padding catagoriesContainer(int index) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: Container(
        child: Center(
            child: Text(
          index.toString(),
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        )),
        width: 80,
        height: 35,
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(5)),
      ),
    );
  }
}
