import 'package:flutter/material.dart';

class TopBarWidget extends StatelessWidget {
  const TopBarWidget({super.key, required this.titleText});
  final String titleText;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        titleText,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
