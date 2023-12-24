import 'package:finalproject/constants/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CreateUserNameView extends StatefulWidget {
  const CreateUserNameView({super.key});

  @override
  State<CreateUserNameView> createState() => _CreateUserNameViewState();
}

class _CreateUserNameViewState extends State<CreateUserNameView> {
  String userName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Image.asset('assets/images/logo.png', fit: BoxFit.cover),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
          child: Column(
            children: [
              Form(
                child: TextFormField(
                  autocorrect: false,
                  enableSuggestions: false,
                  autofocus: true,
                  maxLength: 15,
                  decoration: const InputDecoration(
                      hintText: 'Enter your user name here'),
                  onChanged: (value) {
                    setState(() {
                      userName = value;
                    });
                  },
                ),
              ),
              TextButton(
                onPressed: () async {
                  // Creating userName in FirebaseAuth
                  FirebaseAuth.instance.currentUser
                      ?.updateDisplayName(userName);
                  // Creating userInformation in Firestore:
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(twitterRoute, (route) => false);
                },
                child: const Text(
                  'Create your user name',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
