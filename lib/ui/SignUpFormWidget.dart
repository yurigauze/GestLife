import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:gest_life/core/components/CosmeticElevatedButton.dart';
import 'package:gest_life/core/components/CosmeticPasswordFormField.dart';
import 'package:gest_life/core/components/CosmeticTextFormField.dart';
import 'package:gest_life/core/constants/colors.dart';
import 'package:gest_life/core/constants/sizes.dart';
import 'package:gest_life/core/firebase/Auth.dart';

class CosmeticSignUpFormWidget extends StatelessWidget {
  CosmeticSignUpFormWidget({
    Key? key,
  }) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  FirebaseAuthentication firebaseAuthentication = FirebaseAuthentication();

  String name = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: cosmeticFormHeight - 10,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CosmeticTextFormField(
              controller: _nameController,
              textInputAction: TextInputAction.next,
              borderRadius: 10,
              keyboardType: TextInputType.name,
              textCapitalization: TextCapitalization.words,
              inputText: 'Nome',
              readOnly: false,
              maxLengh: 55,
              icon: const Icon(
                Icons.person_outline_rounded,
                color: cosmeticSecondaryColor,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Informe o Nome!';
                } else {
                  name = value;
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
              inputText: 'E-Mail',
              readOnly: false,
              icon: const Icon(
                Icons.email_outlined,
                color: cosmeticSecondaryColor,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Informe o E-Mail!';
                }
                if (EmailValidator.validate(value)) {
                  email = value;
                } else {
                  return 'E-Mail inválido!';
                }
                return null;
              },
            ),
            const SizedBox(height: cosmeticFormHeight - 20),
            CosmeticPasswordFormField(
              controller: _passwordController,
              textInputAction: TextInputAction.done,
              borderRadius: 10,
              icon: const Icon(
                Icons.fingerprint_rounded,
                color: cosmeticSecondaryColor,
              ),
              inputText: 'Senha',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Informe a Senha!';
                } else if (value.toString().length < 6) {
                  return 'A senha deve conter no mínimo 6 caracteres!';
                } else {
                  password = value;
                }
                return null;
              },
            ),
            const SizedBox(height: cosmeticFormHeight - 10),
            SizedBox(
              width: double.infinity,
              child: CosmeticElevatedButton(
                onPressed: () => {
                  if (_formKey.currentState!.validate())
                    {
                      firebaseAuthentication.signUp(
                        name: _nameController.text,
                        email: _emailController.text,
                        password: _passwordController.text,
                        context: context,
                      ),
                    },
                },
                buttonName: 'CRIAR CONTA',
              ),
            )
          ],
        ),
      ),
    );
  }
}
