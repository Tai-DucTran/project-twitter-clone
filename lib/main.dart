import 'package:finalproject/src/constants/routes.dart';
import 'package:finalproject/src/modules/auth/auth_service.dart';
import 'package:finalproject/src/views/profile/edit_profile_view.dart';
import 'package:finalproject/src/views/add_tweet/add_tweet.dart';
import 'package:finalproject/src/views/profile/create_user_name_view.dart';
import 'package:finalproject/src/views/user_account/login_view.dart';
import 'package:finalproject/src/views/profile/profile_view.dart';
import 'package:finalproject/src/views/user_account/register_view.dart';
import 'package:finalproject/src/views/twitter_view/twitter_view.dart';
import 'package:finalproject/src/views/user_account/verify_email_view.dart';
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
        createUserNameRoute: (context) => const CreateUserNameView(),
        editProfileRoute: (context) => const EditProfileView(),
      },
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AuthServiceController.firebase().initialize(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = AuthServiceController.firebase().currentUser;
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
