import 'package:finalproject/src/constants/routes.dart';
import 'package:finalproject/src/modules/auth/controllers/auth_service_controller.dart';
import 'package:finalproject/src/modules/profile/edit_profile_view.dart';
import 'package:finalproject/src/modules/add_tweet/add_tweet.dart';
import 'package:finalproject/src/modules/sign_up/create_user_name_view.dart';
import 'package:finalproject/src/modules/sign_in/widget/sign_in_view.dart';
import 'package:finalproject/src/modules/profile/profile_view.dart';
import 'package:finalproject/src/modules/sign_up/sign_up_view.dart';
import 'package:finalproject/src/modules/twitter_view/twitter_view.dart';
import 'package:finalproject/src/modules/sign_up/verify_email_view.dart';
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
        loginRoute: (context) => const SignInView(),
        registerRoute: (context) => const SignUpView(),
        twitterRoute: (context) => const TwitterView(),
        verifyEmailRoute: (context) => const VerifyEmailView(),
        addTweetRoute: (context) => const AddTweetView(),
        profileRoute: (context) => const ProfileView(),
        createUserNameRoute: (context) => const CreateUserNameView(),
        editProfileRoute: (context) => const EditProfileView(),
      },
      debugShowCheckedModeBanner: false,
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
                return const TwitterView();
              } else {
                return const VerifyEmailView();
              }
            } else {
              return const SignInView();
            }
          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}
