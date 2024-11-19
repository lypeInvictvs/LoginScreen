import 'package:flutter/material.dart';
import 'package:login_screen/src/models/credencials_model.dart';
import 'package:login_screen/src/shared/colors.dart';
import 'package:login_screen/src/validations/credentials_validator.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final credential = CredentialsModel();
  final validator = CredentialsValidator();
  final formKey = GlobalKey<FormState>();
  final linkProfileGithub = 'https://github.com/lypeInvictvs';
  bool clickEye = false;
  bool isLoginValid() {
    final result = validator.validate(credential);
    return result.isValid;
  }

  Future<void> _launchURL() async {
    final Uri uri = Uri.parse(linkProfileGithub);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw "Unable to access link :( : $linkProfileGithub";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColorLogin,
      body: ListView(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              // Adicionar Image
              Image.asset(
                "lib/src/assets/images/logo2.jpg",
                fit: BoxFit.fill,
              ),
              Container(
                height: MediaQuery.sizeOf(context).height * 0.10,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  color: mainColorLogin,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: const Center(
                  child: Text(
                    "PetCare",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(25),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          onChanged: credential.setEmail,
                          validator: validator.byField(credential, 'email'),
                          decoration: const InputDecoration(
                            labelText: "email",
                          ),
                        ),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          onChanged: credential.setPassword,
                          validator: validator.byField(credential, 'password'),
                          obscureText: clickEye,
                          decoration: InputDecoration(
                              labelText: "password",
                              suffixIcon: InkWell(
                                child: clickEye ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                                onTap: () {
                                  setState(() {
                                    clickEye = !clickEye;
                                  });
                                },
                              )),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        ListenableBuilder(
                          listenable: credential,
                          builder: (context, child) {
                            return ElevatedButton(
                              onPressed: isLoginValid()
                                  ? () {
                                      /*        formKey.currentState?.validate();
                                  final result = validator.validate(credential);
                                  for (final exception in result.exceptions) {
                                    print(exception.message);
                            */
                                      print(credential.showCredential());
                                    }
                                  : null,
                              child: const Text("Log in"),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "All credits reserved. LypeInvictus",
                style: TextStyle(color: Colors.white),
              ),
              GestureDetector(
                onTap: _launchURL,
                child: Text("LypeInvictus"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
