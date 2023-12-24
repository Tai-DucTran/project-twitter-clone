import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FeedPostModel extends StatefulWidget {
  final String id;
  final String creator;
  final String text;
  final DocumentSnapshot documentSnapshot;
  final Timestamp timestamp;

  const FeedPostModel({
    super.key,
    required this.creator,
    required this.text,
    required this.documentSnapshot,
    required this.timestamp,
    required this.id,
  });

  @override
  State<FeedPostModel> createState() => _FeedPostModelState();
}

class _FeedPostModelState extends State<FeedPostModel> {
  final userName = FirebaseAuth.instance.currentUser!.displayName;
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.only(left: 0, right: 0, top: 5, bottom: 10),
        child: Column(
          children: <Widget>[
            ListTile(
              // leading - User's Avata
              leading: Column(
                children: const [
                  Icon(
                    Icons.supervised_user_circle_outlined,
                    size: 45,
                  ),
                ],
              ),
              // title - User's Nam take only 10 letters
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName.toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              // subtitle - User's post
              minVerticalPadding: 10,
              subtitle: Text(
                widget.text,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),

            // Display
            Row(children: <Widget>[
              const Padding(
                  padding: EdgeInsets.only(left: 80, top: 5, bottom: 5)),
              Flexible(
                  child: RichText(
                overflow: TextOverflow.ellipsis,
                strutStyle: const StrutStyle(fontSize: 12),
                text: TextSpan(
                    style: const TextStyle(color: Colors.black54),
                    text: widget.timestamp.toDate().toString()),
              )),
            ]),
            const SizedBox(height: 20)
          ],
        ));
  }
}
