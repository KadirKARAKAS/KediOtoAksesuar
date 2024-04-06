import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kedi_oto_app/constant.dart';
import 'package:permission_handler/permission_handler.dart';

class ProductInfoWidget extends StatefulWidget {
  ProductInfoWidget({super.key});

  @override
  State<ProductInfoWidget> createState() => _ProductInfoWidgetState();
}

class _ProductInfoWidgetState extends State<ProductInfoWidget> {
  final ImagePicker picker = ImagePicker();
  var productNameTextField = TextEditingController();
  var productPriceTextField = TextEditingController();
  var productInfoTextField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        productNameTextFieldWidget(size, productNameTextField),
        const SizedBox(height: 20),
        productInfoTextFieldWidget(size, productInfoTextField),
        const SizedBox(height: 20),
        productPriceTextFieldWidget(size, productPriceTextField),
        const SizedBox(height: 20),
        // catagoriesSelectListviewWidget(size),
        const SizedBox(height: 20),
        imageListViewWidget(size),
        // imageContainerWidget(),
        const SizedBox(height: 20),
        saveProductButtonWidget()
      ],
    );
  }

  // SizedBox catagoriesSelectListviewWidget(Size size) {
  SizedBox imageListViewWidget(Size size) {
    return SizedBox(
      width: size.width,
      height: 305,
      child: ListView.builder(
        padding: EdgeInsets.all(0),
        physics: ScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 1,
        itemBuilder: (context, index) {
          return imageContainerWidget();
        },
      ),
    );
  }

  Padding imageContainerWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 3, right: 5),
      child: InkWell(
        onTap: () async {
          try {
            var status = await Permission.storage.status;
            print("Permission status: $status");
            if (status.isDenied) {
              var result = await Permission.storage.request();
              print("Permission request result: $result");
            }
          } catch (e) {
            print("Error requesting permission: $e");
          }
          addPhotoFunction();
        },
        child: Container(
          width: 200,
          height: 250,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(13),
            boxShadow: const [
              BoxShadow(
                blurRadius: 2,
                color: Colors.black26,
                offset: Offset(-2, 0),
              )
            ],
          ),
          child: selectedImagePath == ""
              ? const Icon(Icons.image, size: 40)
              : ClipRRect(
                  borderRadius: BorderRadius.circular(13),
                  child: Image.file(
                    File(selectedImagePath),
                    fit: BoxFit.cover,
                  ),
                ),
        ),
      ),
    );
  }

  Container productNameTextFieldWidget(
      Size size, TextEditingController productName) {
    return Container(
      width: size.width,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.grey.shade300,
          boxShadow: const [
            BoxShadow(
                blurRadius: 1, color: Colors.black26, offset: Offset(0, 2))
          ]),
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: TextField(
          controller: productName,
          decoration: const InputDecoration(
            hintText: "Ürün Başlığı Girin...",
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Container productPriceTextFieldWidget(
      Size size, TextEditingController productPrice) {
    return Container(
      width: size.width,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.grey.shade300,
          boxShadow: const [
            BoxShadow(
                blurRadius: 1, color: Colors.black26, offset: Offset(0, 2))
          ]),
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: TextField(
          keyboardType: TextInputType.number,
          controller: productPrice,
          decoration: const InputDecoration(
            hintText: "Ürün Fiyatı Girin...",
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Container productInfoTextFieldWidget(
      Size size, TextEditingController productInfo) {
    return Container(
      width: size.width,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.grey.shade300,
          boxShadow: const [
            BoxShadow(
                blurRadius: 1, color: Colors.black26, offset: Offset(0, 2))
          ]),
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: TextField(
          controller: productInfo,
          decoration: const InputDecoration(
            hintText: "Ürün Açıklaması Girin...",
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  addPhotoFunction() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        selectedImagePath = image.path;
      });
    }
  }

  storageSave() async {
    print('start');
    List<String> imagePathList = selectedImagePath.split('/');
    await FirebaseStorage.instance
        .ref('ProductPhoto')
        .child(imagePathList[imagePathList.length - 1])
        .putFile(File(selectedImagePath));
    final imageUrl = await FirebaseStorage.instance
        .ref('ProductPhoto/${imagePathList[imagePathList.length - 1]}')
        .getDownloadURL();
    imageURLL = imageUrl;
  }

  Future<void> addToDatabase() async {
    String productName = productNameTextField.text;
    String productInfo = productInfoTextField.text;
    String productPrice = productPriceTextField.text;

    final product = {
      "productName": productName,
      "productInfo": productInfo,
      "productPrice": productPrice,
      "ProductPhotoURL": imageURLL,
      'createdTime': DateTime.now()
    };

    // Yeni bir belge oluşturmak için `add()` yöntemini kullanın.
    final docRef = await FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("Products")
        .add(product);

    // Oluşturulan belgeye docID ekleyin.
    await docRef.update({'docId': docRef.id});

    productNameTextField.clear();
    productInfoTextField.clear();
    productPriceTextField.clear();
    selectedImagePath = "";

    final userRef = FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("Products")
        .orderBy('createdTime', descending: true);

    final querySnapshot = await userRef.get();
    getdataList.clear();
    querySnapshot.docs.forEach((doc) async {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("Products")
          .doc(doc.id)
          .update({'docId': doc.id});
      getdataList.add(doc.data());
    });
    //  Future.delayed(Duration(milliseconds: 500), () async {
    // print("GETDATALİST VERİLERİ BEKLENİYOR..........");
    // await getdataList.isEmpty
    //     ? SizedBox(
    //         width: size.width,
    //         height: size.height,
    //       )
    //     : setState(() {
    //         circleBool = false;
    //         Navigator.pushReplacement(
    //             context,
    //             MaterialPageRoute(
    //               builder: (context) => const MyPetsPage(),
    //             ));
    //       });
    // });
  }

  InkWell saveProductButtonWidget() {
    return InkWell(
      onTap: () async {
        await storageSave();
        print(
            "FOTOĞRAF EKLENDİ VE BİTTİ --------------------------------------------------------------------");
        await addToDatabase();
        print(
            "VERİLER EKLENDİ--------------------------------------------------------------------");
        Navigator.pop(context);
      },
      child: Container(
        child: Center(
            child: Text(
          "Ürün Ekle",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        )),
        width: 120,
        height: 45,
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(6),
            boxShadow: const [
              BoxShadow(
                  blurRadius: 1, color: Colors.black26, offset: Offset(-1, 1))
            ]),
      ),
    );
  }
}
