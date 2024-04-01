import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TopBarButtonWidget extends StatelessWidget {
  const TopBarButtonWidget({super.key, required this.titleText});
  final String titleText;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        Icon(Icons.arrow_back),
        Container(
          height: 20,
          width: 20,
          color: Colors.red,
        )
      ],
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