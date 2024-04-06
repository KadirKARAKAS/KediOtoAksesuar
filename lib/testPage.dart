import 'dart:io'; // Dosya işlemleri için dart kütüphanesini içe aktarır.

import 'package:flutter/cupertino.dart'; // Cupertino widget'larını kullanmak için flutter kütüphanesinden Cupertino paketini içe aktarır.
import 'package:flutter/material.dart'; // Material Design widget'larını kullanmak için flutter kütüphanesinden Material paketini içe aktarır.
import 'package:image_picker/image_picker.dart'; // Resim seçim işlemleri için image_picker paketini içe aktarır.

class TestPage extends StatefulWidget {
  // TestPage adında bir StatefulWidget sınıfı tanımlar.
  const TestPage({super.key}); // TestPage sınıfının constructor'ını oluşturur.

  @override
  State<TestPage> createState() =>
      _TestPageState(); // TestPage'in durumunu yönetecek olan _TestPageState sınıfını oluşturur.
}

class _TestPageState extends State<TestPage> {
  // TestPage'in durumunu yönetecek olan _TestPageState adında bir sınıf tanımlar.
  final ImagePicker _imagePicker =
      ImagePicker(); // Resim seçme işlemleri için ImagePicker nesnesi oluşturur.
  List<XFile>? _imageFileList =
      []; // XFile türünden bir resim dosyası listesi oluşturur.

  @override
  Widget build(BuildContext context) {
    // TestPage'in görünümünü oluşturan build metodunu tanımlar.
    return Scaffold(
      // Bir Scaffold bileşeni döndürür.
      appBar: AppBar(
        // Scaffold'ın appBar özelliğini oluşturur.
        title: Text('Multiple Images'), // AppBar'ın başlığını belirler.
      ),
      body: SafeArea(
        // Scaffold'ın body özelliğini belirler, bu güvenli bir alan sağlar.
        child: Column(
          // Sütun düzeninde elemanları düzenler.
          children: [
            ElevatedButton(
              // Yükseltilmiş bir düğme oluşturur.
              onPressed: () {
                // Düğmeye tıklanma işlevini belirler.
                selectImages(); // Resimleri seçmek için selectImages() metodunu çağırır.
              },
              child: Text('Select Images'), // Düğmenin metnini belirler.
            ),
            Expanded(
              // Çocuklarının kullanılabileceği tüm boş alanı kaplar.
              child: Padding(
                // Widget'ı kenar boşluğuyla sarmalar.
                padding:
                    const EdgeInsets.all(8.0), // Padding değerlerini belirler.
                child: GridView.builder(
                  // Dinamik olarak bir grid görünümü oluşturur.
                  itemCount: _imageFileList!
                      .length, // Oluşturulacak eleman sayısını belirler.
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    // Grid düzenini oluşturur.
                    crossAxisCount:
                        2, // Çapraz eksen boyunca eleman sayısını belirler.
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    // Her elemanın oluşturulmasını sağlar.
                    return Image.file(
                      // Dosya olarak resim gösterir.
                      File(_imageFileList![index]
                          .path), // Resim dosyasını alır ve gösterir.
                      fit: BoxFit.cover, // Resmin boyutunu belirler.
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> selectImages() async {
    // Resim seçme işlemini gerçekleştiren metodunu tanımlar.
    final List<XFile>? selectedImages = await _imagePicker
        .pickMultiImage(); // Birden fazla resim seçme işlemini gerçekleştirir ve seçilen resimlerin listesini alır.
    if (selectedImages != null && selectedImages.isNotEmpty) {
      // Eğer seçilen resimler null değil ve boş değilse:
      setState(() {
        // State'in değiştiğini bildirir ve yeniden çizim işlemi başlatır.
        _imageFileList!.addAll(
            selectedImages); // Seçilen resimleri _imageFileList'e ekler.
      });
    }
    print(
        "Image List Length: ${_imageFileList!.length}"); // Konsola _imageFileList'in uzunluğunu yazdırır.
  }
}
