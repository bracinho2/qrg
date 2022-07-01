import 'package:flutter/material.dart';

class DropDownWidget extends StatelessWidget {
  final String label;
  final List<String> tones;
  final Function(String?)? onChanged;
  final String? value;
  const DropDownWidget({
    Key? key,
    required this.tones,
    required this.onChanged,
    this.value = 'Selecione',
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: DropdownButtonFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            filled: true,
            labelText: label,
          ),
          isExpanded: true,
          items: tones.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          value: value,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
