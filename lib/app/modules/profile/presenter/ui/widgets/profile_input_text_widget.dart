import 'package:flutter/material.dart';

class ProfileInputTextWidget extends StatelessWidget {
  final String label;
  final String? initialValue;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String value)? onChanged;
  final void Function(String? value)? onSaved;
  final void Function()? onTap;
  final TextInputType? textInputType;
  final bool obscureText;
  final void Function(String?)? error;
  final bool? enabled;
  final int? minLines;
  final int? maxLines;
  final bool? clear;

  const ProfileInputTextWidget({
    Key? key,
    required this.label,
    this.initialValue,
    this.validator,
    this.controller,
    this.onChanged,
    this.onSaved,
    this.onTap,
    this.textInputType,
    this.obscureText = false,
    this.error,
    this.enabled,
    this.minLines,
    this.maxLines,
    this.clear,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 5,
      ),
      child: TextFormField(
        //style: AppTextStyles.textFormsInput,
        initialValue: initialValue,
        minLines: minLines,
        maxLines: maxLines,
        obscureText: obscureText,
        controller: controller,
        onChanged: onChanged,
        onSaved: onSaved,
        enabled: enabled,
        keyboardType: textInputType,
        onTap: onTap,
        //cursorColor: AppColors.cinzaForte,
        decoration: InputDecoration(
          labelText: label,
          //labelStyle: AppTextStyles.textFormsInput,
          //fillColor: AppColors.cinzaFraco,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          suffixIcon: clear != null
              ? IconButton(
                  onPressed: () {
                    controller!.clear();
                  },
                  icon: const Icon(Icons.clear),
                )
              : null,
        ),
        validator: validator,
      ),
    );
  }
}
