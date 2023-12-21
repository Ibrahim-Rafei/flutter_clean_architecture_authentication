import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:authentication/features/authentication/presentation/bloc/authentication/auth_bloc.dart';
import 'package:authentication/features/authentication/presentation/pages/auth/sign_up_page.dart';
import 'package:authentication/features/authentication/presentation/pages/home.dart';
import 'package:authentication/injection_container.dart' as di;
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_)=> di.sl<AuthBloc>()..add(CheckLoggingInEvent()),
        child: BlocBuilder<AuthBloc , AuthState>(
          builder: (context , state) {
            if(state is SignedInPageState){
              return const MaterialApp(
                title: 'Flutter Demo',
                debugShowCheckedModeBanner: false,
                home:  HomePage(),
              );
            }else{
              return  MaterialApp(
                title: 'Flutter Demo',
                theme: ThemeData(
                  useMaterial3: true,
                  colorSchemeSeed: Colors.blue
                ),
                debugShowCheckedModeBanner: false,
                home:  SignUp(),
              );
            }
          }
        )
    );
  }
}
