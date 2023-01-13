import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproject/services/tweet/profile_post_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserPosts extends StatefulWidget {
  const UserPosts({super.key});

  @override
  State<UserPosts> createState() => _UserPostsState();
}

class _UserPostsState extends State<UserPosts> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser?.uid;
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('posts')
            .where('creator', isEqualTo: user)
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
                      text: data['text'] ?? '',
                      timestamp: data['timestamp'] ?? 0,
                      id: data.id,
                    );
                  },
                );
        });
  }
}
