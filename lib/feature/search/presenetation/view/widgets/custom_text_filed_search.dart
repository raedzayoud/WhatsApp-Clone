import 'package:flutter/material.dart';
import 'package:whatsappclone/core/utlis/function/validator.dart';

class CustomTextfiledSearch extends StatelessWidget {
  final TextEditingController? controller;
  final void Function()? onPressed;
  const CustomTextfiledSearch({super.key, this.controller, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        validator: (val) {
          return validateSearch(val);
        },
        controller: controller,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(13)),
              borderSide: BorderSide(
                  color: Colors.white), // Border color when not focused
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(13)),
              borderSide:
                  BorderSide(color: Colors.white), // Border color when focused
            ),
            suffixIcon: IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: onPressed,
            ),
            hintText: "Search for your friend",
            hintStyle: TextStyle(color: Colors.white),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            )),
      ),
    ));
  }
}
