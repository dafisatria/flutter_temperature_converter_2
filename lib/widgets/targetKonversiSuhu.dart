import 'package:flutter/material.dart';

class targetKonversiSuhu extends StatelessWidget {
  const targetKonversiSuhu({
    Key? key,
    required this.selectedDropDown,
    required this.listSatuanSuhu,
    required this.onDropDownChanged,
  }) : super(key: key);

  final String selectedDropDown;
  final List<String> listSatuanSuhu;
  final Function onDropDownChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: selectedDropDown,
      items: listSatuanSuhu.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (value) {
        onDropDownChanged(value);
      },
    );
  }
}