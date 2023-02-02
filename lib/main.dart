import 'package:finalproject/constants/routes.dart';
import 'package:finalproject/services/auth/auth_service.dart';
import 'package:finalproject/services/user/user_firestore_service.dart';
import 'package:finalproject/views/profile/edit_profile_view.dart';
import 'package:finalproject/views/tweet/add_tweet.dart';
import 'package:finalproject/views/profile/create_user_name_view.dart';
import 'package:finalproject/views/user_account/login_view.dart';
import 'package:finalproject/views/profile/profile_view.dart';
import 'package:finalproject/views/user_account/register_view.dart';
import 'package:finalproject/views/twitter_view.dart';
import 'package:finalproject/views/user_account/verify_email_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    UserService _userService = UserService();
    return FutureBuilder(
      future: AuthService.firebase().initialize(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = AuthService.firebase().currentUser;
            final userName = FirebaseAuth.instance.currentUser?.displayName;
            if (user != null) {
              if (user.isEmailVerified) {
                // // if currentUserID is not in the Firestore => createUserNameRoute
                if (userName == null) {
                  return const CreateUserNameView();
                } else {
                  // if currentUserId is in the Firestore => return TwitterRouute;
                  return const Twitter();
                }
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
