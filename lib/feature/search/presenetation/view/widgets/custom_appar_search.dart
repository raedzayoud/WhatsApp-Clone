import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsappclone/constant.dart';
import 'package:whatsappclone/feature/search/presenetation/view/widgets/custom_text_filed_search.dart';

class CustomApparSearch extends StatelessWidget {
  const CustomApparSearch({
    super.key,
    required this.search,
    required this.onPressed,
  });

  final TextEditingController search;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        padding: EdgeInsets.symmetric(horizontal: 2)
            .copyWith(top: MediaQuery.of(context).size.height * 0.05),
        child: Row(
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            CustomTextfiledSearch(
              controller: search,
              onPressed: onPressed,
            )
          ],
        ),
      ),
    );
  }
}
