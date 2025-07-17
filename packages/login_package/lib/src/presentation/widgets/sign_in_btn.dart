import 'package:flutter/material.dart';
import 'package:color_package/color_package.dart';
import 'package:login_package/src/presentation/pages/navigation_screen.dart';
import 'package:login_package/src/presentation/providers/login_provider.dart';
import 'package:provider/provider.dart';

class SigninBtnWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final LoginProvider provider;
  final TextEditingController email, password;

  SigninBtnWidget(
    this.email,
    this.password, {
    super.key,
    required this.formKey,
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      //SIGN IN BUTTON
      padding: const EdgeInsets.symmetric(vertical: 35.0),
      child: SizedBox(
        width: 300.0,
        child: ElevatedButton(
          onPressed: () async {
            // Validate will return true if the form is valid, or false if
            // the form is invalid.
            if (formKey.currentState!.validate()) {
              try {
                final loginProvider = Provider.of<LoginProvider>(
                  context,
                  listen: false,
                );

                final result = await loginProvider.eitherFailureOrLogin(
                  email: email.text,
                  password: password.text,
                );
                result.fold(
                  (failure) => ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("Failed !!"))),
                  (user) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(const SnackBar(content: Text("Success!")));
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NavigationScreenWidget(),
                      ),
                    );
                  },
                );
              } on Exception catch (e) {
                print("Login error: $e");
              }
            } else {
              return;
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.signInBtnColor,
            side: BorderSide(color: Colors.white, width: 1.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: const Text(
            'Sign in',
            style: TextStyle(
              color: Color(0XFFFFFFFF),
              fontSize: 20,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
