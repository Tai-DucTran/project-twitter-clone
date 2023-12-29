import 'package:finalproject/src/constants/routes.dart';
import 'package:finalproject/src/modules/auth/controllers/auth_service_controller.dart';
import 'package:flutter/material.dart';

class CreateUserNameView extends StatefulWidget {
  const CreateUserNameView({super.key});

  @override
  State<CreateUserNameView> createState() => _CreateUserNameViewState();
}

class _CreateUserNameViewState extends State<CreateUserNameView> {
  String newUserName = '';

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
                      newUserName = value;
                    });
                  },
                ),
              ),
              TextButton(
                onPressed: () async {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(twitterRoute, (route) => false);
                  await AuthServiceController.firebase()
                      .createOrUpdateUserName(newUserName);
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
