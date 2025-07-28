import 'package:flutter/material.dart';
//RESOURCES PACKAGES
import 'package:color_package/color_package.dart';
//CUSTOM PACKAGES
import 'package:splash/splash.dart';
//WIDGETS
import 'package:login_package/src/presentation/widgets/forgot_password.dart';
import 'package:login_package/src/presentation/widgets/login_page_img.dart';
import 'package:login_package/src/presentation/widgets/page_title.dart';
import 'package:login_package/src/presentation/widgets/sign_in_btn.dart';
import 'package:login_package/src/presentation/widgets/text_field.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  double horizontalBodyMargin = 20.0;
  double topMargin = 20.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      left: false,
      right: false,
      maintainBottomViewPadding: true,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        //appBar: AppBar(title: const Text("HR App")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.all(20.0),
              height:
                  MediaQuery.of(context).size.height * 0.87, // 80% of screen,
              decoration: BoxDecoration(
                color: AppColors.blue46AEFC, //#46AEFC
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: Builder(
                  builder: (context) {
                    return Form(
                      key: _formKey,
                      child: Container(
                        margin: EdgeInsetsDirectional.only(
                          start: horizontalBodyMargin,
                          end: horizontalBodyMargin,
                          top: 70,
                        ),
                        child: Column(
                          children: <Widget>[
                            //TITLE
                            LoginPageTitleWidget(),
                            SizedBox(height: 50),
                            //IMAGE
                            LoginPageImageWidget(
                              imagePath:
                                  "packages/login_package/assets/login_page_img.png",
                            ),
                            SizedBox(height: 40),
                            //EMAIL
                            TextFieldWidget(
                              //ENTER EMAIL
                              controller: _emailController,
                              customHintText: "Enter Your Email",
                              msg: "Please enter your email !",
                            ),
                            SizedBox(height: 30),
                            //PASSWORD
                            TextFieldWidget(
                              //ENTER PASSWORD
                              controller: _passwordController,
                              customHintText: "Enter Your Password",
                              msg: "Please enter your password !",
                            ),
                            //FORGOT PASSWORD
                            ForgotPasswordWidget(),
                            //SIGN IN
                            SigninBtnWidget(
                              _emailController,
                              _passwordController,
                              formKey: _formKey,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            // Bottom widget
            const PoweredByWidget(),
            const SizedBox(height: 5), // optional bottom spacing
          ],
        ),
      ),
    );
  }
}
