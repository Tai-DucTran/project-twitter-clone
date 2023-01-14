import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproject/services/tweet/postservices.dart';
import 'package:flutter/material.dart';

class ProfilePostModel extends StatefulWidget {
  final String id;
  final String creator;
  final String text;
  final DocumentSnapshot documentSnapshot;
  final Timestamp timestamp;
  const ProfilePostModel({
    super.key,
    required this.creator,
    required this.text,
    required this.documentSnapshot,
    required this.timestamp,
    required this.id,
  });

  @override
  State<ProfilePostModel> createState() => _ProfilePostModelState();
}

class _ProfilePostModelState extends State<ProfilePostModel> {
  final PostService _postService = PostService();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      child: Container(
        width: double.infinity,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 150,
              width: double.infinity,
              child: Card(
                shape: const RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.black12,
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.only(
                    top: 10,
                  ),
                  child: Column(
                    textDirection: TextDirection.ltr,
                    children: [
                      Text(
                        // widget.creator
                        widget.creator,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        // widget.text
                        widget.text,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      Expanded(
                          child: Row(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Edit',
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                _postService
                                    .deletePost(widget.documentSnapshot);
                              },
                              child: const Text('Delete'))
                        ],
                      ))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
