import 'package:flutter/material.dart';

class ProfileInputTextWidget extends StatelessWidget {
  final String label;
  final Icon icon;
  final TextEditingController? controller;
  final void Function(String value)? onChanged;
  final TextInputType? textInputType;
  final bool obscureText;

  const ProfileInputTextWidget({
    Key? key,
    required this.label,
    this.controller,
    this.onChanged,
    this.textInputType,
    this.obscureText = false,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: ListTile(
        leading: icon,
        title: TextFormField(
          obscureText: obscureText,
          controller: controller,
          onChanged: onChanged,
          keyboardType: textInputType,
          decoration: InputDecoration(
            labelText: label,
          ),
        ),
      ),
    );
  }
}
