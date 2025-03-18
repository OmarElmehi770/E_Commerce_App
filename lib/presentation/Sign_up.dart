import 'package:e_commerce_app/presentation/Language_screan.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:restart_app/restart_app.dart';
import '../data/api_manger/api_manger.dart';
import 'Sign_in.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

String? SelectedLanguage;
bool sign_up_password = true;
List<String> Languages = ["Arabic", "English"];

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          actions: [
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: DropdownButton(
            //     items: [
            //       DropdownMenuItem(
            //         value: "ar",
            //         child: Text("Arabic".tr()),
            //       ),
            //       DropdownMenuItem(
            //         value: "en",
            //         child: Text("English".tr()),
            //       ),
            //     ],
            //     onChanged: (val) {
            //       context.setLocale(Locale("$val"));
            //       Restart.restartApp();
            //       setState(() {
            //         SelectedLanguage = val;
            //       });
            //     },
            //     value: SelectedLanguage,
            //     style: TextStyle(color: Colors.white),
            //     dropdownColor: Colors.black,
            //     hint: Text(
            //       "Language",
            //       style: TextStyle(color: Colors.white),
            //     ),
            //   ),
            // ),

            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: IconButton(
            //       onPressed: () {
            //         Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //               builder: (context) => LanguageScrean(),
            //             ));
            //       },
            //       icon: Icon(
            //         Icons.language,
            //         color: Colors.white,
            //       )),
            // ),
          ],
        ),
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
                    Text(
                      "Create Account".tr(),
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    Text(
                      "Sign Up to get started".tr(),
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: nameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "name can't be empty".tr();
                        } else if (value.length < 2) {
                          return 'enter valid name'.tr();
                        }
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person_outline,
                          color: Colors.white,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        label: Text(
                          'Full Name'.tr(),
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
                        obscureText: sign_up_password,
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
                              sign_up_password=!sign_up_password;
                            });
                          },
                          icon: Icon(sign_up_password ==true ? Icons.visibility_off:Icons.visibility),),
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
                          register(nameController.text, emailController.text, passwordController.text,context);
                        }
                      },
                      child: Text(
                        "Register".tr(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 17),
                      ),
                      style:
                          ElevatedButton.styleFrom(minimumSize: Size(200, 50)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account ?".tr(),
                          style: TextStyle(color: Colors.white),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignIn(),
                                  ));
                            },
                            child: Text(
                              "Sign In".tr(),
                              style: TextStyle(color: Colors.red),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

   register (
    String name,
    String email,
    String password,
    BuildContext context,
  ) async {
    ApiManger apiManger = ApiManger();
    showDialog(context: context, builder: (context) => Center(child: CircularProgressIndicator(),),);
    await apiManger.register(name, email, password);
    if(apiManger.register(name, email, password) != null){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Successfully')),
      );
      Navigator.pop(context);
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error')),
      );
    }
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

// DropdownButton(
// items: [
// DropdownMenuItem(
// value: "ar",
// child: Text("Arabic".tr()),
// ),
// DropdownMenuItem(
// value: "en",
// child: Text("English".tr()),
// ),
// ],
// onChanged: (val) {
// context.setLocale(Locale("$val"));
// Restart.restartApp();
// setState(() {
// SelectedLanguage=val ;
// });
// },
// value: SelectedLanguage,
// style: TextStyle(color: Colors.white),
// dropdownColor: Colors.black,
// hint: Text("Language",style: TextStyle(color: Colors.white),),
// ),
