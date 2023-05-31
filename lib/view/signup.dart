import 'package:combined_app/model/components/app_colors.dart';
import 'package:combined_app/model/components/components.dart';
import 'package:combined_app/model/utils/utils.dart';
import 'package:combined_app/view/signin.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.buttonColor,
        centerTitle: true,
        title: const Text(
          'Sign Up',
          style: TextStyle(color: AppColors.buttonTextColor),
        ),
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
                          controller: _nameController,
                          label: "Full Name",
                          hintText: "Muhammad Ahsan",
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please enter your name";
                            }
                            return null;
                          },
                          textInputType: TextInputType.emailAddress),
                      SizedBox(height: context.height * .04),
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
                          hintText: "Create your strong 8 characters password"),
                      SizedBox(height: context.height * .04),
                      MyPasswordFormField(
                          controller: _confirmPasswordController,
                          label: "Confirm Password",
                          hintText: "Retype your password")
                    ],
                  )),
              SizedBox(height: context.height * .04),
              MyButton(title: 'Sign Up', onPress: _signup),
              SizedBox(
                height: context.height * .02,
              ),
              GestureDetector(
                onTap: () => Navigator.pushReplacementNamed(context, '/signin'),
                child: const Text.rich(
                    TextSpan(text: 'Already Have an Account?', children: [
                  TextSpan(
                      text: 'Sign In',
                      style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline))
                ])),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _signup() {
    if (_nameController.text.isEmpty) {
      AppUtils.showflushBar("Please enter your full name!", context);
      return;
    }
    if (_emailController.text.isEmpty) {
      AppUtils.showflushBar("Please enter your email!", context);
      return;
    }
    if (AppUtils.isEmailValidate(_emailController.text.toString())) {
      AppUtils.showflushBar("Please enter a valid email", context);
      return;
    }
    if (_passwordController.text.isEmpty) {
      AppUtils.showflushBar("Please enter your password!", context);
      return;
    }
    if (_passwordController.text.length < 8) {
      AppUtils.showflushBar(
          "Password length must be atleast 8 characters!", context);
      return;
    }
    if (AppUtils.isPasswordValidate(_passwordController.text.toString())) {
      AppUtils.showflushBar(
          "Set your strong password please! password must contain atleast one special, one small, one capital and one numeric character",
          context);
      return;
    }
    if (_confirmPasswordController.text.isEmpty) {
      AppUtils.showflushBar("Please enter your confirm password!", context);
      return;
    }
    if (_passwordController.text != _confirmPasswordController.text) {
      AppUtils.showflushBar("Password not matched!", context);
      return;
    }
    Navigator.pushReplacementNamed(context, '/home');
  }
}
