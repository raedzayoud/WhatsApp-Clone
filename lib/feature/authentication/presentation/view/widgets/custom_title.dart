
import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  final String subtitle;
  const CustomTitle({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
