import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//APP COLORS
import 'package:color_package/color_package.dart';
//PAGES
import 'package:login_package/src/presentation/pages/navigation_screen.dart';
//PROVIDERS
import 'package:login_package/src/application/providers/login_provider.dart';

class SigninBtnWidget extends ConsumerWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController email, password;

  SigninBtnWidget(
    this.email,
    this.password, {
    super.key,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(loginProvider);
    final loginNotifier = ref.read(loginProvider.notifier);

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
                await loginNotifier.login(
                  email: email.text,
                  password: password.text,
                );
                loginState.isLoading
                    ? CircularProgressIndicator()
                    : ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(const SnackBar(content: Text("Success!")));
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NavigationScreenWidget(),
                  ),
                );
              } on Exception catch (e) {
                print("Login error: $e");
              }
            } else {
              return;
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.blue0590DF, //#0590DF
            side: BorderSide(color: Colors.white, width: 1.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: const Text(
            'Sign in',
            style: TextStyle(
              color: AppColors.white,
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
