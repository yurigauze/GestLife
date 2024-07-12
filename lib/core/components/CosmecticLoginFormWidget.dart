import 'package:flutter/material.dart';
import 'package:gest_life/core/components/CometicTextFormField.dart';
import 'package:gest_life/core/components/CosmeticElevatedButton.dart';
import 'package:gest_life/core/components/CosmeticPasswordFormField.dart';
import 'package:gest_life/core/constants/colors.dart';
import 'package:gest_life/core/constants/sizes.dart';


class CosmeticLoginFormWidget extends StatelessWidget {
  CosmeticLoginFormWidget({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();


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
                }
                return null;
              },
            ),
            const SizedBox(height: cosmeticFormHeight - 25),
            
          ],
        ),
      ),
    );
  }
}
