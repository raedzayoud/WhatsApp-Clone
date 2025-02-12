

import 'package:flutter/material.dart';
import 'package:whatsappclone/core/utlis/assets.dart';

class UserTitleSearch extends StatelessWidget {
  final String name;
  final String email;
  final String userId;

  const UserTitleSearch({
    super.key,
    required this.name,
    required this.email,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(AssetsImage.man),
        ),
        Expanded(
          child: ListTile(
            title: Text(name),
            subtitle: Text(email),
          ),
        ),
      ],
    );
  }
}
