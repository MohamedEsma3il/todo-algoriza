import 'package:flutter/material.dart';

class DefaultFormField extends StatelessWidget {
  DefaultFormField(
      {Key? key,
      required this.controller,
      required this.type,
      required this.label,
      this.prefix,
      required this.validate,
      required this.isPassword,
      this.onChange,
      this.onSubmit,
      this.onTap,
      this.suffix,
      this.suffixPressed})
      : super(key: key);
  final TextEditingController controller;
  final TextInputType type;
  final String label;
  final Widget? prefix;
  final String? Function(String? value) validate;
  final VoidCallback? onTap;
  final Function? onSubmit;
  final Function(String)? onChange;
  bool isPassword = false;
  final IconData? suffix;
  final VoidCallback? suffixPressed;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      controller: controller,
      keyboardType: type,
      validator: validate,
      onTap: onTap,
      onChanged: onChange,
      onFieldSubmitted: (s) {
        onSubmit!(s);
      },
      decoration: InputDecoration(
        fillColor: Colors.grey[300],
        filled: true,
        labelText: label,
        prefixIcon: prefix,
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(suffix),
              )
            : null,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
