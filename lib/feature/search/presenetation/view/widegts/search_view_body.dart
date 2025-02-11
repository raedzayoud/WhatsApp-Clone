import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsappclone/core/utlis/assets.dart';
import 'package:whatsappclone/feature/search/presenetation/view/widegts/custom_appar_search.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController search = TextEditingController();
    return Column(
      children: [
        CustomApparSearch(
          search: search,
          onPressed: () {},
        ),
        Expanded(
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
                    subtitle: Text("raed.zayoud.23@gmail.com"),
                  ),
                ),
              ],
            );
          },
                ),
        ),
      ],
    );
  }
}
