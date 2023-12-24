import 'package:finalproject/modules/tweet/post_services/post_firestore_services.dart';
import 'package:flutter/material.dart';

class AddTweetView extends StatefulWidget {
  const AddTweetView({super.key});

  @override
  State<AddTweetView> createState() => _AddTweetViewState();
}

class _AddTweetViewState extends State<AddTweetView> {
  final PostService _postService = PostService();
  String text = '';

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
                    //Create the "Cancel" button
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black45,
                        ),
                      ),
                    ),

                    Expanded(child: Container()),
                    TextButton(
                      onPressed: () {
                        // Creating Post : Not Tweet -> Draft
                        _postService.draftingTweet(text);

                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Draft',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.blue,
                        ),
                      ),
                    ),

                    ElevatedButton(
                      onPressed: () async {
                        // Creating Post : Tweet
                        _postService.creatingTweet(text);

                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Tweet',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                    child: TextFormField(
                  autocorrect: false,
                  autofocus: true,
                  maxLines: null,
                  maxLength: 280,
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: "What's happening?"),
                  onChanged: (val) {
                    setState(() {
                      text = val;
                    });
                  },
                ))
              ],
            )));
  }
}
