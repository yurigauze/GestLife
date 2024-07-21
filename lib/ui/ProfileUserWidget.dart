import 'package:flutter/material.dart';
import 'package:gest_life/core/components/GestLifeAutoComplete.dart';
import 'package:gest_life/core/components/GestLifeDropdown.dart';
import 'package:gest_life/core/constants/colors.dart';
import 'package:gest_life/core/constants/sizes.dart';
import 'package:gest_life/core/enum/TypeUser.dart';
import 'package:gest_life/core/firebase/firestore/CurrentUserDetails.dart';

class ProfileUserWidget extends StatefulWidget {
  const ProfileUserWidget({Key? key}) : super(key: key);

  @override
  _ProfileUserWidgetState createState() => _ProfileUserWidgetState();
}

class _ProfileUserWidgetState extends State<ProfileUserWidget> {
  String selectedValue = 'Item 1'; // Defina um valor padrão se necessário
  TextEditingController _controller =
      TextEditingController(); // Defina o controlador

  @override
  void dispose() {
    _controller.dispose(); // Lembre-se de descartar o controlador
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> dropdownItems =
        TypeUser.values.map((type) => type.name).toList();

    CurrentUserDetails currentUserDetails = CurrentUserDetails();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: cosmeticWhiteColor,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: cosmeticPrimaryColor,
        ),
      ),
      backgroundColor: cosmeticWhiteColor,
      body: Center(
        child: Container(
          width: 600,
          padding: const EdgeInsets.all(
            cosmeticDefaultSize,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                // Adiciona um Expanded aqui
                child: GestLifeAutoComplete(
                  inputText: "Search fruits...",
                  icon: Icon(Icons.search, color: Colors.grey),
                  keyboardType: TextInputType.text,
                  borderRadius: 10.0,
                  readOnly: false,
                  searchCallback: currentUserDetails.mockSearch,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
