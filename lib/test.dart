import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

// Ana Widget
class PermissionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Permission Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            var status = await Permission.storage.status;
            if (status.isDenied) {
              print('İzin önceden reddedildi');
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('İzin Gerekli'),
                    content: Text(
                        'Uygulamanın bu özelliği kullanabilmesi için depolama izni gereklidir.'),
                    actions: <Widget>[
                      TextButton(
                        child: Text('Vazgeç'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text('İzin Ver'),
                        onPressed: () async {
                          var status = await Permission.storage.request();
                          Navigator.of(context).pop();
                          if (status.isGranted) {
                            print('Kullanıcı izni verdi');
                          } else {
                            print('Kullanıcı izni vermedi');
                          }
                        },
                      ),
                    ],
                  );
                },
              );
            } else if (status.isGranted) {
              print('İzin önceden soruldu ve kullanıcı izni verdi');
            } else {
              print('İzin önceden soruldu ve kullanıcı izni vermedi');
            }
            print(status);
            print("----------------------------------------");
          },
          child: Text('İzni Kontrol Et'),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PermissionPage(),
  ));
}
