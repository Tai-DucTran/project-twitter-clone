import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PostService {
  // Return the userID
  final userId = FirebaseAuth.instance.currentUser?.uid;
  final userName = FirebaseAuth.instance.currentUser?.displayName;
  // Collection Reference:
  CollectionReference posts = FirebaseFirestore.instance.collection('posts');

  // Creating Post -> Successful Tweet
  Future<void> creatingTweet(text) async {
    await FirebaseFirestore.instance.collection('posts').add({
      'creator': userId,
      'timestamp': FieldValue.serverTimestamp(),
      'text': text,
    });
  }

  // Creating Post -> not Tweet -> Draft
  Future<void> draftingTweet(text) async {
    await FirebaseFirestore.instance.collection('drafts').add({
      'creator': userId,
      'timestamp': FieldValue.serverTimestamp(),
      'text': text,
    });
  }

  // Delete userPost:
  Future<void> deletePost(DocumentSnapshot doc) async {
    await FirebaseFirestore.instance.collection('posts').doc(doc.id).delete();
  }

  // Edit userPost:
  Future<void> editPost(DocumentSnapshot doc, String text) async {
    await FirebaseFirestore.instance.collection('posts').doc(doc.id).update({
      'text': {text}
    });
  }

  // Preparing docIds with
  Future<void> returnDocIdForSingleUser(userId) async {
    FirebaseFirestore.instance
        .collection('posts')
        .where('creator', isEqualTo: userId)
        .snapshots();
  }

  // Edit updateUserName:
  Future<void> updateUserName(
      DocumentSnapshot doc, String updateUserName) async {
    await FirebaseFirestore.instance
        .collection('posts')
        .doc(doc.id)
        .update({'user_name': updateUserName});
  }

  // Testing with FirebaseFirestore:
  // Fetch userPosts in realTime
  Future<void> readRealTimeUserPosts() async {
    await FirebaseFirestore.instance
        .collection('posts')
        .where('creator', isEqualTo: userId)
        .orderBy('timestamp', descending: true)
        .get()
        .then((QuerySnapshot querySnapshot) {
      // ignore: avoid_function_literals_in_foreach_calls
      querySnapshot.docs.forEach((doc) {
        // ignore: avoid_print
        print(doc['text']);
        // ignore: avoid_print
        print(doc['timestamp']);
      });
    });
  }
}
