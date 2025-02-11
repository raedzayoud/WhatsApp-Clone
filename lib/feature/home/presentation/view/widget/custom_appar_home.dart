
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsappclone/constant.dart';
import 'package:whatsappclone/core/utlis/router.dart';
import 'package:whatsappclone/feature/home/presentation/view/widget/custom_icon_button.dart';

class CustomApparHome extends StatelessWidget {
  const CustomApparHome({
    super.key,
  });

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
        padding: EdgeInsets.symmetric(horizontal: 10)
            .copyWith(top: MediaQuery.of(context).size.height * 0.05),
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
            CustomIconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {
                Get.toNamed(AppRouter.search);
              },
            ),
            CustomIconButton(
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
