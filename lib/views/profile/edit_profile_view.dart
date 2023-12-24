import 'package:finalproject/modules/about_me/user_firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants/routes.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfileView> {
  final picker = ImagePicker();
  String newName = '';
  final UserService _userService = UserService();
  final userId = FirebaseAuth.instance.currentUser?.uid;
  final userName = FirebaseAuth.instance.currentUser?.displayName;
  final userEmail = FirebaseAuth.instance.currentUser?.email;

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
              // cancelTextButton
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
              // saveTextButton
              TextButton(
                  onPressed: () async {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      twitterRoute,
                      (route) => false,
                    );
                    await _userService.changeUserName(userId, newName);
                    FirebaseAuth.instance.currentUser
                        ?.updateDisplayName(newName);
                  },
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
              children: [
                const SizedBox(
                  width: 80,
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
                      onChanged: (value) {
                        setState(() {
                          newName = value;
                        });
                      },
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  width: 110,
                  child: Text(
                    'avataURL',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.only(right: 80),
                  child: ElevatedButton(
                    onPressed: () {
                      // getImage(0);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black12,
                    ),
                    child: const Text(
                      "Upload Image",
                      style: TextStyle(color: Colors.black87),
                    ),
                  ),
                ),
              ],
            )
          ]),
        ),
        Card(
          margin: const EdgeInsets.only(top: 2),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  width: 110,
                  child: Text(
                    'bannerURL',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.only(right: 80),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black12,
                    ),
                    child: const Text(
                      "Upload Image",
                      style: TextStyle(color: Colors.black87),
                    ),
                  ),
                ),
              ],
            )
          ]),
        ),
        Card(
          margin: const EdgeInsets.only(top: 5, bottom: 5),
          child: Column(children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 150,
                  height: 25,
                  child: Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: Text(
                    userEmail.toString(),
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ],
            )
          ]),
        ),
      ]),
    );
  }
}
