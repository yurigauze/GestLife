import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gest_life/core/components/GestLifeAutoComplete.dart';
import 'package:gest_life/core/components/GestLifeDropdown.dart';
import 'package:gest_life/core/constants/colors.dart';
import 'package:gest_life/core/constants/sizes.dart';
import 'package:gest_life/core/enum/TypeUser.dart';
import 'package:gest_life/core/firebase/firestore/CurrentUserDetails.dart';
import 'package:gest_life/core/firebase/firestore/UserDetails.dart';

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

    String displayUser(dynamic value) {
      if (value is String) {
        return value;
      } else {
        // Handle the case where value is not a String if necessary
        return "Invalid data";
      }
    }

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
              GestLifeDropdown(
                  items: dropdownItems,
                  hintText: 'Qual seu tipo usuário?',
                  onItemChanged: (String newValue) {
                    setState(() {
                      selectedValue = newValue;
                    });
                  },
                  validator: (value) {
                    String? val = value as String?;
                    if (value == null || value.isEmpty) {
                      return 'Please select an item';
                    }
                    return null;
                  }),
              Expanded(
                child: GestLifeAutoComplete<String>(
                  inputText: "Busque seu médico pelo nome..",
                  icon: Icon(Icons.search, color: Colors.grey),
                  keyboardType: TextInputType.text,
                  borderRadius: 10.0,
                  readOnly: false,
                  searchCallback: currentUserDetails.mockSearch,
                  displayFunction: displayUser,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
