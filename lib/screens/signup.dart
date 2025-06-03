import 'package:application/screens/signin.dart';
import 'package:application/styles/app_colors.dart';
import 'package:application/widgets/custom_button.dart';
import 'package:application/widgets/custom_formfield.dart';
import 'package:application/widgets/custom_header.dart';
import 'package:application/widgets/custom_richtext.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _userName = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String get userName => _userName.text.trim();
  String get email => _emailController.text.trim();
  String get password => _passwordController.text.trim();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(height: 20),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: AppColors.blue,
          ),
          CustomHeader(
            text: 'Inscription',
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Signin()),
              );
            },
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.08,
            child: Container(
              margin: const EdgeInsets.only(top: 30),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: AppColors.whiteshade,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width * 0.8,
                    margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.09,
                    ),
                    child: Image.asset("assets/images/login.png"),
                  ),
                  const SizedBox(height: 16),
                  CustomFormField(
                    headingText: "Nom d'utilisateur",
                    hintText: "Nom d'utilisateur",
                    obsecureText: false,
                    suffixIcon: const SizedBox(),
                    maxLines: 1,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.text,
                    controller: _userName,
                  ),
                  const SizedBox(height: 16),
                  CustomFormField(
                    headingText: "Email",
                    hintText: "Email",
                    obsecureText: false,
                    suffixIcon: const SizedBox(),
                    maxLines: 1,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.emailAddress,
                    controller: _emailController,
                  ),
                  const SizedBox(height: 16),
                  CustomFormField(
                    maxLines: 1,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.text,
                    controller: _passwordController,
                    headingText: "Mot de Passe",
                    hintText: "Minimum 8 caractères",
                    obsecureText: true,
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.visibility),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(height: 16),
                  AuthButton(onTap: () {}, text: 'S\'inscrire'),
                  CustomRichText(
                    discription: 'Vous avez déjà un compte ? ',
                    text: 'Se connecter',
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const Signin()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
