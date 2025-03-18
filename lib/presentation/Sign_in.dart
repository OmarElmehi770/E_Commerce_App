import 'package:e_commerce_app/data/api_manger/api_manger.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:restart_app/restart_app.dart';
import '../data/model/register_responce.dart';
import 'Home.dart';
import 'Sign_up.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

String? SelectedLanguage;
bool password = true;

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Welcome Back".tr(),
                        style: TextStyle(color: Colors.white, fontSize: 30)),
                    Text("Login to continue".tr(),
                        style: TextStyle(color: Colors.grey, fontSize: 15)),
                    SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: emailController,
                      validator: (input) => input!.isValidEmail()
                          ? null
                          : input.isEmpty
                              ? "email can't be empty"
                              : "Check your email".tr(),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.mail_outline,
                          color: Colors.white,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        label: Text(
                          'Email Address'.tr(),
                          style: TextStyle(color: Colors.grey),
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade900,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                    TextFormField(
                      obscureText: password,
                      style: TextStyle(color: Colors.white),
                      controller: passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "password can't be empty".tr();
                        } else if (value.length < 8) {
                          return "Password can't be less than 8 character".tr();
                        }
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: Colors.white,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              password = !password;
                            });
                          },
                          icon: Icon(password == true
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        label: Text(
                          'Password'.tr(),
                          style: TextStyle(color: Colors.grey),
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade900,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          signIn(emailController.text, passwordController.text,
                              context);
                        }
                      },
                      child: Text("Log In".tr(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 17)),
                      style:
                          ElevatedButton.styleFrom(minimumSize: Size(200, 50)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Doesn't have an account ?".tr(),
                            style: TextStyle(color: Colors.white)),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignUp(),
                                  ));
                            },
                            child: Text("Sign Up".tr(),
                                style: TextStyle(color: Colors.red))),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton(
                        items: [
                          DropdownMenuItem(
                            value: "ar",
                            child: Text("Arabic".tr()),
                          ),
                          DropdownMenuItem(
                            value: "en",
                            child: Text("English".tr()),
                          ),
                        ],
                        onChanged: (val) {
                          context.setLocale(Locale("$val"));
                          Restart.restartApp();
                          setState(() {
                            SelectedLanguage = val;
                          });
                        },
                        value: SelectedLanguage,
                        style: TextStyle(color: Colors.white),
                        dropdownColor: Colors.black,
                        hint: Text(
                          "Language",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  signIn(String email, String password, BuildContext context) async {
    ApiManger apiManger = ApiManger();
    showDialog(
      context: context,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );
    RegisterResponce? responce = await apiManger.signIn(email, password);
    if (responce != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Successfully')),
      );
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Homepage(),
          ));
    } else {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error')),
      );
    }
  }
}
