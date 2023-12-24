import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproject/modules/firestore_tweet_service/models/profile_post_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FletchingUserPosts extends StatefulWidget {
  const FletchingUserPosts({super.key});

  @override
  State<FletchingUserPosts> createState() => _FletchingUserPostsState();
}

class _FletchingUserPostsState extends State<FletchingUserPosts> {
  @override
  Widget build(BuildContext context) {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('posts')
            .where('creator', isEqualTo: userId)
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          return !snapshot.hasData
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot data = snapshot.data!.docs[index];
                    return ProfilePostModel(
                      documentSnapshot: data,
                      creator: data['creator'],
                      // userName: data['user_name'],
                      text: data['text'] ?? '',
                      timestamp: data['timestamp'] ?? 0,
                      id: data.id,
                    );
                  },
                );
        });
  }
}
