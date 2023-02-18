import 'package:finalproject/constants/routes.dart';
import 'package:finalproject/main.dart';
import 'package:finalproject/views/profile/create_user_name_view.dart';
import 'package:finalproject/views/profile/edit_profile_view.dart';
import 'package:finalproject/views/profile/profile_view.dart';
import 'package:finalproject/views/add_tweet/add_tweet.dart';
import 'package:finalproject/views/twitter_view/twitter_view.dart';
import 'package:finalproject/views/user_account/login_view.dart';
import 'package:finalproject/views/user_account/register_view.dart';
import 'package:finalproject/views/user_account/verify_email_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

extension WidgetTesterX on WidgetTester {
  /// Calls [pumpWidget] on [myApp] and awaits until its initialised.

  Future<void> pumpApp([Widget myApp = const CreateWidgetUnderTest()]) async {
    const isCI = bool.fromEnvironment('IS_CI');

    await Future<void>.delayed(
      const Duration(milliseconds: isCI ? 2000 : 1000),
    );
    await pumpWidget(myApp, const Duration(milliseconds: isCI ? 3000 : 2000));

    for (var i = 0; i < (isCI ? 5 : 2); i++) {
      await pumpAndSettle(const Duration(milliseconds: 1000));
    }
  }
}

class CreateWidgetUnderTest extends StatefulWidget {
  const CreateWidgetUnderTest({super.key});

  @override
  State<CreateWidgetUnderTest> createState() => _CreateWidgetUnderTestState();
}

class _CreateWidgetUnderTestState extends State<CreateWidgetUnderTest> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}
