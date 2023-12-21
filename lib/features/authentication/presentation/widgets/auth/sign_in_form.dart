import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:authentication/features/authentication/domain/entities/sign_in_entity.dart';
import 'package:authentication/features/authentication/presentation/bloc/authentication/auth_bloc.dart';
import 'package:authentication/features/authentication/presentation/pages/auth/sign_up_page.dart';
import 'package:authentication/features/authentication/presentation/pages/home.dart';

import '../../pages/auth/verify_email.dart';


class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ConstrainedBox(
                  constraints: const BoxConstraints(
                      maxWidth: 500
                  ),
                  child: TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your E-Mail';
                      } else if (!EmailValidator.validate(value)) {
                        return 'Please enter a valid E-Mail';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20,),
                ConstrainedBox(
                  constraints: const BoxConstraints(
                      maxWidth: 500
                  ),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText:isVisible?false : true,
                    decoration:  InputDecoration(
                      labelText: 'Password',
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon:  Icon(
                          isVisible ? Icons.visibility : Icons.visibility_off,
                          color: Colors.grey,
                        ), onPressed: () {
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 5) {
                        return 'The password must contains more than five characters.';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20,),
                BlocConsumer<AuthBloc,AuthState>(
                  listener: (context , state){
                    if(state is SignedInState){
                      BlocProvider.of<AuthBloc>(context).add(CheckLoggingInEvent());
                    }else if (state is SignedInPageState  || state is GoogleSignInState){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const HomePage()));
                    }else if (state is VerifyEmailPageState ){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const VerifyEmail()));
                      BlocProvider.of<AuthBloc>(context).add(SendEmailVerificationEvent());
                    }
                  },
                  builder: (context,state) {
                    if(state is LoadingState){
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }else if (state is ErrorAuthState){
                      return Column(
                        children: [
                          Center(
                            child: Text(state.message),
                          ),
                          ElevatedButton(
                          onPressed: (){
                          BlocProvider.of<AuthBloc>(context).add(SignInEvent(signInEntity: SignInEntity(password: _passwordController.text , email: _usernameController.text)));
                          },
                          style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          )),
                          minimumSize: MaterialStateProperty.all(const Size(500, 50)),
                          textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 18)),
                          ),
                          child: const Text('Login'),
                          ),
                        ],
                      );

                    }
                    return ElevatedButton(
                      onPressed: (){
                        BlocProvider.of<AuthBloc>(context).add(SignInEvent(signInEntity: SignInEntity(password: _passwordController.text , email: _usernameController.text)));
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                        minimumSize: MaterialStateProperty.all(const Size(500, 50)),
                        textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 18)),
                      ),
                      child: const Text('Login'),
                    );
                  }
                ),
                Container(
                    margin: const EdgeInsets.all(20),
                    child:  Stack(
                      alignment: Alignment.center,
                      children: [
                        ConstrainedBox(
                            constraints: const BoxConstraints(
                                maxWidth: 500
                            ),
                            child: const Divider(thickness: 2,color: Colors.grey,)),
                        Positioned(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 5 , vertical: 3),
                            child: const Text(
                              'OR',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        )
                      ],
                    )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    optionsBox(
                        color: Colors.blue,
                        imagePath: "assets/facebook_icon.png",
                        onPressed: (){
                        }
                    ),
                    optionsBox(
                        color: Colors.red,
                        imagePath: "assets/google_icon.png",
                        onPressed: (){
                          BlocProvider.of<AuthBloc>(context).add(SignInWithGoogleEvent());
                        }
                    ),
                    optionsBox(
                        color: Colors.blue,
                        imagePath: "assets/twitter_icon.png",
                        onPressed: (){
                        }
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Need an account?"),
                    TextButton(
                        onPressed: (){
                          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) =>const SignUp()));
                        },
                        child: const Text("Signup") )
                  ],
                )
              ],
            ),
          ),
    );
  }

  Widget optionsBox({Color? color , required String? imagePath, required Function? onPressed }){
    return InkWell(
      onTap: (){
        onPressed!();
      },
      child: Container(
          height: 50,
          margin: const EdgeInsets.only(top: 0 , bottom: 20 , left: 10 ,right: 10  ),
          width: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(50),
          ),
          child:  Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset(imagePath!, color: color,))
      ),
    );
  }

}
