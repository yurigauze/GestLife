import 'package:flutter/material.dart';
import 'package:gest_life/core/style/DropdownStyle.dart';

class GestLifeDropdown extends StatefulWidget {
  String hintText = '';
  List<String> items = [];
  ValueChanged<String> onItemChanged;
  FormFieldValidator validator;

  GestLifeDropdown({
    Key? key,
    required this.items,
    required this.hintText,
    required this.onItemChanged,
    required this.validator,
  }) : super(key: key);

  @override
  State<GestLifeDropdown> createState() => _GestLifeDropDownState();
}

class _GestLifeDropDownState extends State<GestLifeDropdown> {
  @override
  Widget build(BuildContext context) {
    String selectedItem;
    var dropdownStyle = DropdownStyle.dropdownStyle(label: widget.hintText);
    return DropdownButtonFormField<String>(
      value: null,
      decoration: dropdownStyle,
      validator: widget.validator,
      items: widget.items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: (String? item) {
        setState(() {
          selectedItem = item!;
        });
        widget.onItemChanged(item!);
      },
    );
  }
}
