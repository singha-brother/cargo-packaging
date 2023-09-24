// import 'package:cargo_packaging/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField(
      {super.key,
      required this.labelText,
      this.validator,
      this.onChange,
      this.textInputType = TextInputType.text,
      this.autoFocus = false,
      this.initialValue,
      this.controller,
      this.icon});

  final String labelText;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final Function(String)? onChange;
  final bool autoFocus;
  final String? initialValue;
  final TextEditingController? controller;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onChanged: onChange,
      controller: controller,
      keyboardType: textInputType,
      autofocus: autoFocus,
      initialValue: initialValue,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondaryContainer,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
          borderSide: const BorderSide(
            color: Colors.blue,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
          borderSide: const BorderSide(
            color: Colors.blue,
          ),
        ),
        filled: true,
        fillColor: Colors.white,
        labelText: labelText,
        prefixIcon: icon,
        labelStyle: const TextStyle(
            // color: Theme.of(context).secondaryHeaderColor,
            // fontSize: 18.0,
            // fontWeight: FontWeight.w500,
            ),
        // fillColor: Colors.grey.shade100,
        // filled: true,
        // floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      textInputAction: TextInputAction.next,
    );
  }
}
