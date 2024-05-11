import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kedi_oto_app/constant.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => TestPageState();
}

class TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TEST PAGE"),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    circleBool = true; // circleBool değerini değiştiriyoruz
                    print("sadadas");
                  });
                },
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.red,
                  child: Text("CIRCLE BUTTON"),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    circleBool = false; // circleBool değerini değiştiriyoruz
                    print("sadadas");
                  });
                },
              ),
            ],
          ),
          loadingCircle()
        ],
      ),
    );
  }

  Widget loadingCircle() {
    if (circleBool) {
      return SizedBox(
        height: 50,
        width: 50,
        child: CircularProgressIndicator(
          backgroundColor: Colors.orange,
          strokeWidth: 5,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
        ),
      );
    } else {
      return SizedBox.shrink();
    }
  }
}
