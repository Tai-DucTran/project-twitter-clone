import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproject/services/display_tweet/models/feed_post_model.dart';
import 'package:finalproject/services/user/user_firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FeedPosts extends StatefulWidget {
  const FeedPosts({super.key});

  @override
  State<FeedPosts> createState() => _FeedPostsState();
}

class _FeedPostsState extends State<FeedPosts> {
  UserService _userService = UserService();

  @override
  Widget build(BuildContext context) {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('posts')
            .where('creator', isNotEqualTo: userId)
            .snapshots(),
        builder: (context, snapshot) {
          return !snapshot.hasData
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot data = snapshot.data!.docs[index];
                    return FeedPostModel(
                      documentSnapshot: data,
                      creator: data['creator'],
                      userName: data['user_name'],
                      text: data['text'] ?? '',
                      timestamp: data['timestamp'] ?? 0,
                      id: data.id,
                    );
                  },
                );
        });
  }
}
