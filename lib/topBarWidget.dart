import 'package:flutter/material.dart';
import 'package:kedi_oto_app/constant.dart' as globals;

class TopBarWidget extends StatefulWidget {
  const TopBarWidget({super.key, required this.titleText});
  final String titleText;

  @override
  State<TopBarWidget> createState() => _TopBarWidgetState();
}

class _TopBarWidgetState extends State<TopBarWidget> {
  @override
  Widget build(BuildContext context) {
    TextEditingController adminID = TextEditingController();
    TextEditingController adminPassword = TextEditingController();

    return GestureDetector(
      onDoubleTap: () {
        if (globals.admin) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Oturumu Kapat'),
                content: const SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Text('Admin oturumunu kapatmak istiyor musunuz?'),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text('Hayır'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  TextButton(
                    child: const Text('Evet'),
                    onPressed: () {
                      globals.admin = false;
                      Navigator.pop(context);

                      print("admin oturumu kapatıldı");
                    },
                  ),
                ],
              );
            },
          );
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              bool loginFailed = false;

              return StatefulBuilder(
                builder: (context, setState) {
                  return AlertDialog(
                    title: const Text('Admin Giriş'),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          TextField(
                            controller: adminID,
                            decoration: const InputDecoration(
                              hintText: "Kullanıcı Adı Giriniz:",
                            ),
                          ),
                          TextField(
                            controller: adminPassword,
                            decoration: const InputDecoration(
                              hintText: "Şifre Giriniz:",
                            ),
                            obscureText: true,
                          ),
                          if (loginFailed)
                            const Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                'Giriş bilgileri hatalı.',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Giriş Yap'),
                        onPressed: () {
                          if (adminID.text == "kediotoadmin" &&
                              adminPassword.text == "anil55") {
                            globals.admin = true;
                            setState(() {
                              Navigator.pop(context);
                            });
                            print("admin+");
                          } else {
                            setState(() {
                              loginFailed = true;
                            });
                            print("admin-");
                          }
                        },
                      ),
                    ],
                  );
                },
              );
            },
          );
        }
      },
      child: Center(
        child: Text(
          widget.titleText,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Double Tap Example'),
        ),
        body: Center(
          child: TopBarWidget(titleText: 'Çift Tıklama Testi'),
        ),
      ),
    );
  }
}
