import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

ValueNotifier<int> valueNotifierX = ValueNotifier(0);

String userID = "";
List<Map<String, dynamic>> getdataList = [];
List<String> docIDList = [];
List<String> imageURLLL = [];
List<Map<String, dynamic>> productPhotoList = [];
String selectedImagePath = '';
String imageURLL = "";
int geciciIndex = 0;
final ImagePicker _imagePicker = ImagePicker();
bool admin = false;
bool circleBool = false;
var updadteParagraf = "";
var updatePrice = "";
var listeboyu = getdataList.length;

String productTitleChanged = '';
String productParagrafChanged = '';
String productPriceChanged = '';

var updatedTitle = "";
