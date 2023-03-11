import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.tiaction,
    this.isPassword = false,
    this.suffixicon,
    this.controller,
    this.validator,
    this.readOnly = false,
    required this.keyboardType,
    this.prefixicon,
  }) : super(key: key);
  final String hintText;
  final bool isPassword;

  final Widget? suffixicon;
  final TextEditingController? controller;
  final TextInputAction tiaction;
  final String? Function(String?)? validator;
  final bool readOnly;
  final TextInputType? keyboardType;
  final Widget? prefixicon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: tiaction,
      controller: controller,
      readOnly: readOnly,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.fromLTRB(10.0, 30.0, 30.0, 10.0),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                10,
              ),
            ),
            borderSide: BorderSide(
                style: BorderStyle.none,
                color: Color.fromARGB(255, 53, 88, 94)),
          ),
          hintText: hintText,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
                style: BorderStyle.none,
                color: Color.fromARGB(255, 126, 199, 212)),
            borderRadius: BorderRadius.all(
              Radius.circular(
                10,
              ),
            ),
          ),
          prefixIcon: prefixicon,
          suffixIcon: suffixicon),
    );
  }
}
