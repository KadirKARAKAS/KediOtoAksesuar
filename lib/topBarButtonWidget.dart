import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TopBarButtonWidget extends StatelessWidget {
  const TopBarButtonWidget({super.key, required this.titleText});
  final String titleText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
          Text(
            titleText,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          ),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}
// Center(
//       child: Text(
//         titleText,
//         style: const TextStyle(
//             fontSize: 28,
//             fontWeight: FontWeight.w600,
//             shadows: [Shadow(color: Colors.black, blurRadius: 1.5)]),
//       ),
//     );