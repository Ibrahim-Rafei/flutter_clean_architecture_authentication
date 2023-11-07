import 'package:flutter/material.dart';
import 'package:authentication/features/authentication/presentation/widgets/auth/sign_up_form.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
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
                child: Text("Signup", style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold),)),
            SizedBox(height: 10,),
            SignUpForm(),
          ],
        ),
      ),
    );
  }
}
