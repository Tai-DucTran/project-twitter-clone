import 'package:finalproject/constants/routes.dart';
import 'package:finalproject/services/auth/auth_service.dart';
import 'package:finalproject/services/tweet/profile_post_model.dart';
import 'package:finalproject/views/add_tweet.dart';
import 'package:finalproject/views/login_view.dart';
import 'package:finalproject/views/profile/profile_view.dart';
import 'package:finalproject/views/register_view.dart';
import 'package:finalproject/views/twitter_view.dart';
import 'package:finalproject/views/verify_email_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        loginRoute: (context) => const LoginView(),
        registerRoute: (context) => const RegisterView(),
        twitterRoute: (context) => const Twitter(),
        verifyEmailRoute: (context) => const VerifyEmailView(),
        addTweetRoute: (context) => const AddTweetView(),
        profileRoute: (context) => const ProfileView(),
      },
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AuthService.firebase().initialize(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = AuthService.firebase().currentUser;
            if (user != null) {
              if (user.isEmailVerified) {
                return const Twitter();
              } else {
                return const VerifyEmailView();
              }
            } else {
              return const LoginView();
            }
          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}
