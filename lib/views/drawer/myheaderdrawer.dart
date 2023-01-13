import 'package:flutter/material.dart';

class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({super.key});

  @override
  State<MyHeaderDrawer> createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
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
              margin: const EdgeInsets.only(right: 200),
              height: 55,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.lightBlue,
              ),
            ),
            Expanded(
                child: (Container(
                    padding: const EdgeInsets.only(right: 200, top: 10),
                    child: Column(
                      textDirection: TextDirection.ltr,
                      children: const [
                        Text(
                          'user_name',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('@username'),
                      ],
                    ))))
          ],
        ));
  }
}
