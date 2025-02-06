
import 'package:flutter/material.dart';
import 'package:whatsappclone/constant.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
              color: KPrimayColor, borderRadius: BorderRadius.circular(20)),
          margin: EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          child: MaterialButton(
              child: Text(
                text,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              onPressed:onPressed),
        ),
      ),
    );
  }
}
