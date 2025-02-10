import 'package:flutter/material.dart';
import 'package:whatsappclone/constant.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.16,
          width: double.infinity,
          decoration: BoxDecoration(
            color: KPrimayColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10).copyWith(top: 20),
            child: Row(
              children: [
                Text(
                  "Chat Room",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.logout,
                      color: Colors.white,
                    )),
              ],
            ),
          ),
        )
      ],
    );
  }
}
