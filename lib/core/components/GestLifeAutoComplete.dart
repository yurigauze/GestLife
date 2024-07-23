import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gest_life/core/constants/colors.dart';

typedef SearchCallback<T> = Future<List<T>> Function(String query);

class GestLifeAutoComplete<T extends Object> extends StatefulWidget {
  final SearchCallback<T> searchCallback;
  String inputText;
  Icon icon;
  TextInputType keyboardType;
  String? initialValue;
  double borderRadius;
  FormFieldValidator? validator;
  TextEditingController? controller;
  TextInputAction? textInputAction;
  bool readOnly;
  int? maxLengh;
  TextCapitalization? textCapitalization;
  final String Function(T) displayFunction;

  GestLifeAutoComplete(
      {Key? key,
      required this.inputText,
      required this.icon,
      required this.keyboardType,
      required this.borderRadius,
      required this.readOnly,
      this.validator,
      this.initialValue,
      this.controller,
      this.textInputAction,
      this.maxLengh,
      this.textCapitalization,
      required this.searchCallback,
      required this.displayFunction})
      : super(key: key);

  @override
  _GestLifeAutoCompleteState createState() => _GestLifeAutoCompleteState();
}

class _GestLifeAutoCompleteState<T extends Object>
    extends State<GestLifeAutoComplete<T>> {
  final TextEditingController _controller = TextEditingController();
  List<T> _suggestions = [];
  Timer? _debounce;
  T? _selectedValue;

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 200), () {
      if (query.isNotEmpty && query.length > 2) {
        widget.searchCallback(query).then((results) {
          setState(() {
            _suggestions = results;
          });
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSelected(T value) {
    setState(() {
      _controller.text = widget.displayFunction(value);
      _selectedValue = value;
      _suggestions = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: _controller,
          onChanged: _onSearchChanged,
          decoration: InputDecoration(
            label: Text(widget.inputText),
            prefixIcon: widget.icon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                width: 2.0,
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _suggestions.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(10), // Border radius as an example
                  border: Border.all(
                    width: 1.0, // Width of the border
                  ),
                ),
                child: ListTile(
                  title: Text(widget.displayFunction(_suggestions[index])),
                  onTap: () => _onSelected(
                      _suggestions[index]), // Event to select the suggestion
                ),
              );
            },
          ),
        )
      ],
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Column(
  //     children: [
  //       TextFormField(
  //         textInputAction: widget.textInputAction,
  //         keyboardType: widget.keyboardType,
  //         validator: widget.validator,
  //         readOnly: widget.readOnly,
  //         maxLength: widget.maxLengh,
  //         onChanged: _onSearchChanged,
  //         textCapitalization:
  //             widget.textCapitalization ?? TextCapitalization.none,
  //         decoration: InputDecoration(
  //           label: Text(widget.inputText),
  //           prefixIcon: widget.icon,
  //           border: OutlineInputBorder(
  //             borderRadius: BorderRadius.circular(widget.borderRadius),
  //           ),
  //           labelStyle: const TextStyle(
  //             color: cosmeticSecondaryColor,
  //           ),
  //           focusedBorder: OutlineInputBorder(
  //             borderRadius: BorderRadius.circular(widget.borderRadius),
  //             borderSide: const BorderSide(
  //               width: 2.0,
  //               color: cosmeticSecondaryColor,
  //             ),
  //           ),
  //         ),
  //       ),
  //       Expanded(
  //         child: ListView.builder(
  //           itemCount: _suggestions.length,
  //           itemBuilder: (context, index) => ListTile(
  //             title: Text(_suggestions[index]),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
