import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  final userId = FirebaseAuth.instance.currentUser?.uid;
  final userEmail = FirebaseAuth.instance.currentUser?.email;
  final userName = FirebaseAuth.instance.currentUser?.displayName;

  // Collection Reference:
  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  // Creating User Information (email, userName, userID)
  Future<void> creatingUserInformation(userName) async {
    await usersCollection.add({
      'user_id': userId,
      'user_name': userName,
      'email': userEmail,
    });
  }

  // Fetch userInformation return bool value
  Future<bool> checkUserIsExistInDatabase(userId) async {
    bool checkUserIsExist = await usersCollection
        .doc(userId)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        return true;
      } else {
        return false;
      }
    });
    if (checkUserIsExist == false) {
      return false;
    } else {
      return true;
    }
  }

  // Fetching userInformation return data:
  Future<void> readUserInformation(userId) async {
    await usersCollection
        .where('user_id', isEqualTo: userId)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc['user_id']);
        print(doc['@user_name']);
        print(doc['email']);
      });
    });
  }

  Future<String> getUserName(userId) async {
    DocumentSnapshot snap = await usersCollection.doc(userId).get();
    String userName = snap['@user_name'];
    return userName;
  }
}

void main() {
  final userName = FirebaseAuth.instance.currentUser?.displayName;
  print(userName);
}
