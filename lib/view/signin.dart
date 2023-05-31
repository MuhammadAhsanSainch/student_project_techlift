import 'package:combined_app/model/components/app_colors.dart';
import 'package:combined_app/model/utils/utils.dart';
// import 'package:combined_app/view_model/auth.dart';
import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:combined_app/model/components/components.dart';

extension MediaQueryValues on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}

class Signin extends StatefulWidget {
  const Signin({
    Key? key,
  }) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  // final AuthService _authService = AuthService();

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, //disable back arrow
        flexibleSpace: Container(
          decoration: const BoxDecoration(color: Color(0xffffbc24)),
        ),
        backgroundColor: AppColors.buttonColor,
        title: const Center(
            child: Text(
          'Sign in',
          style: TextStyle(color: AppColors.buttonTextColor),
        )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: context.width * .06, vertical: context.height * .02),
          child: Column(
            children: [
              Image.asset('images/techlift_logo.png'),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      MyTextFormField(
                          controller: _emailController,
                          label: "Email",
                          hintText: "ahsansainch@gmail.com",
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please enter your email";
                            }
                            return null;
                          },
                          textInputType: TextInputType.emailAddress),
                      SizedBox(height: context.height * .04),
                      MyPasswordFormField(
                          controller: _passwordController,
                          label: "Password",
                          hintText: "Enter your password")
                    ],
                  )),
              SizedBox(height: context.height * .02),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
              SizedBox(height: context.height * .01),
              MyButton(title: 'Login', onPress: _signin),
              SizedBox(
                height: context.height * .02,
              ),
              const Text(
                '---Or Sign in with---',
                style: TextStyle(color: Colors.black54),
              ),
              SizedBox(height: context.height * .02),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: _facebookSignin,
                      icon: const Icon(Icons.facebook),
                      label: const Text(
                        'Facebook',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: context.width * .04,
                  ),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {}, //_googleSignin,
                      icon: Image.asset(
                        'images/flat-color-icons_google.png',
                        width: 24,
                        height: 24,
                      ),
                      label: const Text(
                        'Google',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: context.height * .05,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: const Text.rich(
                    TextSpan(text: "Don't have an Account? ", children: [
                  TextSpan(
                      text: 'Sign up',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.blue))
                ])),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _signin() {
    if (_emailController.text.isEmpty) {
      AppUtils.showflushBar('Please enter email!', context);
      return;
    }
    if (_passwordController.text.isEmpty) {
      AppUtils.showflushBar('Please enter password!', context);
      return;
    }
    // if (AppUtils.isEmailValidate(_emailController.text.toString())) {
    //   AppUtils.showflushBar(
    //       'Please enter a valid email address! Like ahsansainch@gmail.com ',
    //       context);
    //   return;
    // }

    // if (AppUtils.isPasswordValidate(_passwordController.text.toString())) {
    //   AppUtils.showflushBar(
    //       'Password must be atleast 8 characters long! and must contain atleast one capital letter one small letter and one special character Like AB12%^ci',
    //       context);
    //   return;
    // }
    Navigator.pushReplacementNamed(context, '/home');
  }

  void _facebookSignin() {}

  // void _googleSignin() async {
  //   GoogleSignInAccount googleSignInAccount =
  //       await _authService.signInWithGoogle();
  // }
}
