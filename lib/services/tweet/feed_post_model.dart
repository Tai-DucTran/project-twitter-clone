import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproject/services/tweet/postservices.dart';
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
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Container(
        width: double.infinity,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 140,
              width: double.infinity,
              child: Card(
                shape: const RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.black12,
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.only(top: 30, left: 0, right: 10),
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
                      )
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
