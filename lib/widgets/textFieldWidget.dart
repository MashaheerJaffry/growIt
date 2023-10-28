import 'package:flutter/material.dart';

import '../constant.dart';

Widget textFieldWidget(var hintText, TextEditingController controller) {
  return Container(
    padding: const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
    child: TextField(
      controller: controller,
      style: kFieldStyle,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        fillColor: kWhite,
        filled: true,
        hintText: hintText,
        hintStyle: kFieldStyle,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
  );
}

Widget textFieldWidgetWithPrefix(
    var hintText, TextEditingController controller, IconData icon) {
  return Container(
    padding: const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
    child: TextField(
      controller: controller,
      style: kFieldStyle,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        fillColor: kWhite,
        filled: true,
        hintText: hintText,
        hintStyle: kFieldStyle,
        prefixIcon: Icon(
          icon,
          color: kSupportiveGrey,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
  );
}
