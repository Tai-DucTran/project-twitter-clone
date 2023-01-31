import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../constants/routes.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfileView> {
  final userName = FirebaseAuth.instance.currentUser?.displayName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        Container(
          padding: const EdgeInsets.only(top: 60),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    twitterRoute,
                    (route) => false,
                  );
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.black54, fontSize: 18),
                ),
              ),
              const Text(
                'Edit Profile',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text('Save',
                      style: TextStyle(color: Colors.black54, fontSize: 18)))
            ],
          ),
        ),
        const SizedBox(height: 80),
        Card(
          margin: const EdgeInsets.only(top: 2),
          // symmetric(vertical: 0, horizontal: 5),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 100,
                  child: Text(
                    'Name',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: Form(
                    child: TextFormField(
                      autocorrect: false,
                      autofocus: false,
                      enableSuggestions: false,
                      maxLength: 15,
                      decoration: InputDecoration(
                        hintText: '$userName',
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        counter: const Offstage(),
                        hintStyle: const TextStyle(height: 2.5),
                      ),
                    ),
                  ),
                )
              ],
            )
          ]),
        ),
        Card(
          margin: const EdgeInsets.only(top: 2),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 100,
                  child: Text(
                    'avataURL',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: Form(
                    child: TextFormField(
                      autocorrect: false,
                      autofocus: false,
                      enableSuggestions: false,
                      maxLength: 15,
                      decoration: InputDecoration(
                        hintText: '$userName',
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        counter: const Offstage(),
                        hintStyle: const TextStyle(height: 2.5),
                      ),
                    ),
                  ),
                )
              ],
            )
          ]),
        ),
        Card(
          margin: const EdgeInsets.only(top: 2),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 110,
                  child: Text(
                    'backgroundURL',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: Form(
                    child: TextFormField(
                      autocorrect: false,
                      autofocus: false,
                      enableSuggestions: false,
                      maxLength: 15,
                      decoration: InputDecoration(
                        hintText: '$userName',
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        counter: const Offstage(),
                        hintStyle: const TextStyle(height: 2.5),
                      ),
                    ),
                  ),
                )
              ],
            )
          ]),
        ),
      ]),
    );
  }
}
