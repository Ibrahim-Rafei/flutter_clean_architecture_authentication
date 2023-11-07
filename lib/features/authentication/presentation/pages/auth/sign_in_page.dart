import 'package:flutter/material.dart';
import 'package:authentication/features/authentication/presentation/widgets/auth/sign_in_form.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: const [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Image(
                  height: 200,
                  width: 200,
                  image: AssetImage("assets/sign_in.png")),
            ),
            Center(
                child: Text("Login", style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold),)),
            SizedBox(height: 10,),
            LoginForm(),
          ],
        ),
      ),
    );
  }
}
