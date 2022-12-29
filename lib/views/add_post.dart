import 'package:finalproject/constants/routes.dart';
import 'package:flutter/material.dart';

class AddPostView extends StatefulWidget {
  const AddPostView({super.key});

  @override
  State<AddPostView> createState() => _AddPostViewState();
}

class _AddPostViewState extends State<AddPostView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              twitterRoute, (route) => false);
                        },
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black45,
                          ),
                        )),
                    Expanded(child: Container()),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Draft',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.blue,
                          ),
                        )),
                    const SizedBox(
                      width: 15,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(30, 25)),
                        onPressed: () {},
                        child: const Text(
                          'Tweet',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                const TextField(
                  autocorrect: false,
                  autofocus: true,
                  maxLines: null,
                  maxLength: 280,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: "What's happening?"),
                )
              ],
            )));
  }
}
