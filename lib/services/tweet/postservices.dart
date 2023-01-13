import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PostService {
  // Return the userID
  final user = FirebaseAuth.instance.currentUser?.uid;
  // Collection Reference:
  CollectionReference posts = FirebaseFirestore.instance.collection('posts');

  // Creating Post -> Successful Tweet
  Future<void> creatingTweet(text) async {
    await FirebaseFirestore.instance.collection('posts').add({
      'creator': user,
      'timestamp': FieldValue.serverTimestamp(),
      'text': text,
    });
  }

  // Creating Post -> not Tweet -> Draft
  Future<void> draftingTweet(text) async {
    await FirebaseFirestore.instance.collection('drafts').add({
      'creator': user,
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
    await FirebaseFirestore.instance
    .collection('posts')
    .doc(doc.id)
    .update({'text' : {text}})
    ;
  }

  // Testing with FirebaseFirestore:
  // Fetch userPosts in realtimeThis
  Future<void> readUserPosts() async {
    await FirebaseFirestore.instance
        .collection('posts')
        .where('creator', isEqualTo: user)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc['text']);
        print(doc['timestamp']);
      });
    });
  }
}
