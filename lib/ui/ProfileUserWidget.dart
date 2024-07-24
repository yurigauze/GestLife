import 'package:flutter/material.dart';
import 'package:gest_life/core/components/CosmeticElevatedButton.dart';
import 'package:gest_life/core/components/CosmeticTextFormField.dart';
import 'package:gest_life/core/components/GestLifeAutoComplete.dart';
import 'package:gest_life/core/components/GestLifeDropdown.dart';
import 'package:gest_life/core/constants/colors.dart';
import 'package:gest_life/core/constants/imagePath.dart';
import 'package:gest_life/core/constants/sizes.dart';
import 'package:gest_life/core/enum/TypeUser.dart';
import 'package:gest_life/core/firebase/firestore/CurrentUserDetails.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileUserWidget extends StatefulWidget {
  final String name;
  final String email;

  const ProfileUserWidget({Key? key, required this.name, required this.email})
      : super(key: key);

  @override
  _ProfileUserWidgetState createState() => _ProfileUserWidgetState();
}

class _ProfileUserWidgetState extends State<ProfileUserWidget> {
  late String selectedValue = "";
  TextEditingController _controller = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _crmController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    _emailController.dispose();
    _crmController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.name;
    _emailController.text = widget.email;
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
          elevation: 0,
          iconTheme: const IconThemeData(
            color: cosmeticPrimaryColor,
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              width: 600,
              padding: const EdgeInsets.all(
                cosmeticDefaultSize,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 120,
                    width: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: const Image(
                        image: AssetImage(
                          cosmeticUserProfileImage,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: cosmeticPrimaryColor,
                      ),
                      child: const Icon(
                        LineAwesomeIcons.camera_solid,
                        size: 20,
                      ),
                    ),
                  ),
                  CosmeticTextFormField(
                    controller: _nameController,
                    textInputAction: TextInputAction.next,
                    borderRadius: 10,
                    keyboardType: TextInputType.emailAddress,
                    inputText: 'Nome',
                    readOnly: false,
                    icon: const Icon(
                      Icons.person,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Informe o Nome';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: cosmeticFormHeight - 20),
                  CosmeticTextFormField(
                    controller: _emailController,
                    textInputAction: TextInputAction.next,
                    borderRadius: 10,
                    keyboardType: TextInputType.emailAddress,
                    inputText: 'Email',
                    readOnly: true,
                    enabled: false,
                    icon: const Icon(
                      Icons.email,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Informe o Email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: cosmeticFormHeight - 20),
                  GestLifeDropdown(
                      items: dropdownItems,
                      hintText: 'Qual seu tipo usuário?',
                      onItemChanged: (String newValue) {
                        setState(() {
                          print(selectedValue);
                          selectedValue = newValue;
                        });
                      },
                      validator: (value) {
                        String? val = value as String?;
                        if (value == null || value.isEmpty) {
                          return 'Por favor seleciona tipo de usuário!';
                        }
                        return null;
                      }),
                  const SizedBox(height: cosmeticFormHeight - 20),
                  if (selectedValue == "Médico")
                    CosmeticTextFormField(
                      controller: _crmController,
                      textInputAction: TextInputAction.next,
                      borderRadius: 10,
                      keyboardType: TextInputType.text,
                      inputText: 'CRM *',
                      readOnly: false,
                      icon: const Icon(
                        Icons.document_scanner_outlined,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Informe o CRM';
                        }
                        return null;
                      },
                    ),
                  if (selectedValue == "Paciente")
                    Visibility(
                      visible: selectedValue == "Paciente",
                      child: Container(
                        height: 100, // Minimum height to ensure some size
                        child: GestLifeAutoComplete<String>(
                          inputText: "Busque seu médico pelo nome..",
                          icon: const Icon(Icons.search, color: Colors.grey),
                          keyboardType: TextInputType.text,
                          borderRadius: 10.0,
                          readOnly: false,
                          searchCallback: currentUserDetails.mockSearch,
                          displayFunction: displayUser,
                        ),
                      ),
                    ),
                  const SizedBox(height: cosmeticFormHeight - 20),
                  SizedBox(
                    width: double.infinity,
                    child: CosmeticElevatedButton(
                      buttonName: 'Salvar',
                      onPressed: () => {},
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
