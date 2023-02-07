import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  final userId = FirebaseAuth.instance.currentUser?.uid;
  final userEmail = FirebaseAuth.instance.currentUser?.email;
  final userName = FirebaseAuth.instance.currentUser?.displayName;

  // Collection Reference:
  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  // Creating User Information (email, userName, userID) - it works | checked
  Future<void> creatingUserInformation(userName) async {
    await usersCollection.doc(userId).set({
      'user_id': userId,
      'user_name': userName,
      'email': userEmail,
    });
  }

  // Fetch userInformation return bool value - it work | checked
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

  // Fetch userName from usersCollection
  Future<String> returnUserName(userId) async {
    final userName = await usersCollection.doc(userId).get().then((value) {
      return value.get('user_name').toString();
    });
    return userName;
  }

  // Change userName in editProfile page - it works | checked
  Future<void> changeUserName(userId, String newName) async {
    await usersCollection.doc(userId).update({'user_name': newName});
  }
}

void main() {
  final userName = FirebaseAuth.instance.currentUser?.displayName;
  print(userName);
}
