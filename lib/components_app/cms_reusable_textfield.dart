import 'package:flutter/material.dart';

import '../app_constants.dart';

class ReusableTextField extends StatelessWidget {
  const ReusableTextField(
      {Key? key,
      this.labelText,
      this.hintText,
      this.controller,
      this.icon,
      this.obsecureText})
      : super(key: key);

  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final IconData? icon;
  final bool? obsecureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
          controller: controller,
          obscureText: obsecureText!,
          decoration: InputDecoration(
            prefixIcon: Icon(icon),
            labelText: labelText,
            enabledBorder: outlineInputBorder,
            focusedBorder: outlineInputFocusBorder,
          )),
    );
  }
}
