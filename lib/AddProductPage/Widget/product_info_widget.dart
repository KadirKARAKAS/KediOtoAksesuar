import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kedi_oto_app/HomePage/Page/home_page.dart';
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
  var productLinkTextField = TextEditingController();

  List<XFile>? _imageFileList = [];
  final ImagePicker _imagePicker = ImagePicker();

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Column(
          children: [
            productNameTextFieldWidget(size, productNameTextField),
            const SizedBox(height: 20),
            productInfoTextFieldWidget(size, productInfoTextField),
            const SizedBox(height: 20),
            productPriceTextFieldWidget(size, productPriceTextField),
            const SizedBox(height: 20),
            productLinkdWidget(size, productLinkTextField),
            const SizedBox(height: 20),
            multipleImageGridView(size),
            const SizedBox(height: 20),
            saveProductButtonWidget(0),
          ],
        ),
        Positioned.fill(
          child: Center(child: loadingCircle()),
        ),
      ],
    );
  }

  Positioned circleWidgetEnSon() {
    return Positioned.fill(
      child: InkWell(
        onTap: () {
          setState(() {
            circleBool = true;
          });
        },
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Container(
          color: Colors.transparent,
        ),
      ),
    );
  }

  InkWell multipleImageGridView(Size size) {
    return InkWell(
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
        selectImages();
      },
      child: Container(
        width: size.width,
        height: 340,
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(15)),
        child: _imageFileList!.isEmpty
            ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.image, size: 50),
                    Text(
                      "Lütfen resim seçin\n(Birden Fazla Resim Seçebilirsiniz.)",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              )
            : GridView.builder(
                shrinkWrap: true,
                itemCount: _imageFileList!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1),
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.file(
                        File(_imageFileList![index].path),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
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

  Container productLinkdWidget(
      Size size, TextEditingController productLinkTextField) {
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
          controller: productLinkTextField,
          decoration: const InputDecoration(
            hintText: "Ürün Linkini Girin...",
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

  Future<void> storageSave(List<XFile> x) async {
    imageURLLL.clear();
    for (XFile imageFile in _imageFileList!) {
      String imagePath = imageFile.path;
      File image = File(imagePath);

      String imageName = imagePath.split('/').last;
      TaskSnapshot uploadSnapshot = await FirebaseStorage.instance
          .ref('ProductPhotos/$imageName')
          .putFile(image);

      if (uploadSnapshot.state == TaskState.success) {
        String imageUrl = await uploadSnapshot.ref.getDownloadURL();
        print('Uploaded image URL: $imageUrl');

        imageURLLL.add(imageUrl);
      } else {
        print('Image upload failed');
      }
    }
    print("Image URLSSS  $imageURLLL");
  }

  Future<void> addToDatabase(int index) async {
    String productName = productNameTextField.text;
    String productInfo = productInfoTextField.text;
    String productPrice = productPriceTextField.text;

    final product = {
      "productName": productName,
      "productInfo": productInfo,
      "productPrice": productPrice,
      "ProductPhotoURL": _imageFileList![index].path,
      'createdTime': DateTime.now()
    };

    // Yeni bir belge oluşturmak için `add()` yöntemini kullanın.
    final docRef = await FirebaseFirestore.instance
        .collection('Users')
        .doc("IQX8DBt1HaXXg6qdBIfMS0OLsEe2")
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
        .doc("IQX8DBt1HaXXg6qdBIfMS0OLsEe2")
        .collection("Products")
        .orderBy('createdTime', descending: true);

    final querySnapshot = await userRef.get();
    getdataList.clear();
    querySnapshot.docs.forEach((doc) async {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc("IQX8DBt1HaXXg6qdBIfMS0OLsEe2")
          .collection("Products")
          .doc(doc.id)
          .update({'docId': doc.id});
      getdataList.add(doc.data());
    });
  }

  InkWell saveProductButtonWidget(int index) {
    return InkWell(
      onTap: () async {
        setState(() {
          circleBool = true;
        });
        print(circleBool);
        await storageSave(List.empty());
        print(
            "FOTOĞRAF EKLENDİ VE BİTTİ --------------------------------------------------------------------");
        await addToDatabasee(0);
        print(
            "VERİLER EKLENDİ--------------------------------------------------------------------");

        setState(() {
          circleBool = false;
        });
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
            (route) => false);
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

  Future<void> selectImages() async {
    final List<XFile>? selectedImages = await _imagePicker.pickMultiImage();
    if (selectedImages != null && selectedImages.isNotEmpty) {
      setState(() {
        _imageFileList!.addAll(selectedImages);
      });
    }
    print("Image List Length: ${_imageFileList!.length}");
  }

  Future<void> addToDatabasee(int index) async {
    if (_imageFileList != null &&
        _imageFileList!.isNotEmpty &&
        index < _imageFileList!.length) {
      _imageFileList!.clear();
      print("ImageUrlll addToDb  $imageURLLL");
      String productName = productNameTextField.text;
      String productInfo = productInfoTextField.text;
      String productPrice = productPriceTextField.text;
      String productLink = productLinkTextField.text;

      final product = {
        "productName": productName,
        "productInfo": productInfo,
        "productPrice": productPrice,
        "productLink": productLink,
        "ProductPhotoURL": imageURLLL,
        'createdTime': DateTime.now()
      };

      final docRef = await FirebaseFirestore.instance
          .collection('Users')
          .doc("IQX8DBt1HaXXg6qdBIfMS0OLsEe2")
          .collection("Products")
          .add(product);

      await docRef.update({'docId': docRef.id});

      _imageFileList!.clear();
      print('Image files cleared: ${_imageFileList!.isEmpty}');

      for (XFile imageFile in _imageFileList!) {
        File image = File(imageFile.path);
        await image.delete();
        print('Image file deleted: ${image.path}');
      }

      productNameTextField.clear();
      productInfoTextField.clear();
      productPriceTextField.clear();
      productLinkTextField.clear();
      selectedImagePath = "";

      final userRef = FirebaseFirestore.instance
          .collection("Users")
          .doc("IQX8DBt1HaXXg6qdBIfMS0OLsEe2")
          .collection("Products")
          .orderBy('createdTime', descending: true);

      final querySnapshot = await userRef.get();
      getdataList.clear();
      querySnapshot.docs.forEach((doc) async {
        await FirebaseFirestore.instance
            .collection('Users')
            .doc("IQX8DBt1HaXXg6qdBIfMS0OLsEe2")
            .collection("Products")
            .doc(doc.id)
            .update({'docId': doc.id});
        getdataList.add(doc.data());
      });
    } else {
      print("Image list is empty or index is out of range");
    }
  }

  Widget loadingCircle() {
    if (circleBool) {
      return Stack(children: [
        SizedBox(
          height: 50,
          width: 50,
          child: CircularProgressIndicator(
            backgroundColor: Colors.white,
            strokeWidth: 5,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
          ),
        )
      ]);
    } else {
      return SizedBox.shrink();
    }
  }
}
