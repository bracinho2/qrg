import 'package:flutter/material.dart';

class DropDownWidget extends StatelessWidget {
  final List<String> tones;
  final Function(String?)? onChanged;
  const DropDownWidget({
    Key? key,
    required this.tones,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DropdownButtonFormField(
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
            filled: false,
            isDense: false,
            //prefixIcon: Icon(Icons.subtitles),
            //hintText: '',
            labelText: 'Subtom'),
        isExpanded: true,
        items: tones.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        //value: _selectedSubtom,
        onChanged: onChanged,
      ),
    );
  }
}
