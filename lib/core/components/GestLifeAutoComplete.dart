import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gest_life/core/constants/colors.dart';

typedef SearchCallback = Future<List<String>> Function(String query);

class GestLifeAutoComplete extends StatefulWidget {
  final SearchCallback searchCallback;
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
      required this.searchCallback})
      : super(key: key);

  @override
  _GestLifeAutoCompleteState createState() => _GestLifeAutoCompleteState();
}

class _GestLifeAutoCompleteState extends State<GestLifeAutoComplete> {
  final TextEditingController _controller = TextEditingController();
  List<String> _suggestions = [];
  Timer? _debounce;
  String? _selectedValue;

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
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

  void _onSelected(String value) {
    setState(() {
      _controller.text =
          value; // Atualiza o controlador de texto com o valor selecionado
      _selectedValue = value; // Armazena o valor selecionado
      _suggestions = []; // Limpa as sugestões
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
            labelText: widget.inputText,
            prefixIcon: widget.icon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _suggestions.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_suggestions[index]),
                onTap: () => _onSelected(_suggestions[
                    index]), // Adiciona um evento de toque para selecionar a sugestão
              );
            },
          ),
        ),
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
