
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final String url;
  const CustomImage({
    super.key,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 140, child: Center(child: Image.asset(url)));
  }
}
