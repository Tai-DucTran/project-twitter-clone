import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({super.key});

  @override
  State<MyHeaderDrawer> createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  final userName = FirebaseAuth.instance.currentUser?.displayName;
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        height: 0,
        width: double.infinity,
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 150),
              height: 55,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.lightBlue,
              ),
            ),
            Expanded(
                child: (Container(
                    padding: const EdgeInsets.only(right: 150, top: 10),
                    child: Column(
                      textDirection: TextDirection.ltr,
                      children: [
                        Text(
                          userName.toString(),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("@${userName.toString()}"),
                      ],
                    ))))
          ],
        ));
  }
}
