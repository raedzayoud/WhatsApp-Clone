
import 'package:flutter/material.dart';
import 'package:whatsappclone/core/utlis/assets.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(AssetsImage.man),
              ),
              Expanded(
                child: ListTile(
                  title: Text("Alex"),
                  subtitle: Text("Good"),
                  trailing: Text("12:00"),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
