import 'package:flutter/material.dart';
import 'Home.dart';
import 'Sign_up.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Welcome Back",style: TextStyle(color: Colors.white,fontSize: 30),),
                Text("Login to continue",style: TextStyle(color: Colors.grey,fontSize: 15),),
                SizedBox(height: 50,),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail_outline,color: Colors.white,),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                    label: Text('Email Address',style: TextStyle(color: Colors.grey),),
                    filled: true,
                    fillColor: Colors.grey.shade900,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline,color: Colors.white,),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                    label: Text('Password',style: TextStyle(color: Colors.grey),),
                    filled: true,
                    fillColor: Colors.grey.shade900,
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                  ),
                ),
                SizedBox(height: 15,),
                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage(),));

                },
                  child: Text("Log In",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 17
                  ),),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(200, 50)
                  ),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Doesn't have an account ?",style: TextStyle(color: Colors.white),),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp(),));
                    }, child: Text("Sign Up",style: TextStyle(color: Colors.red),)),
                  ],
                )
              ],
            ),
          ),
        )
    );
  }
}
