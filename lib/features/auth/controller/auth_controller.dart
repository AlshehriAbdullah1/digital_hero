import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthController {
  AuthController._();

  static final AuthController _instance = AuthController._();

  static AuthController get instance => _instance;
  void signOut() {
    FirebaseAuth.instance.signOut();
  }
  
  Future<String?> signUp(
      String email, String password, String name, String phoneNumber) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      String? uid = userCredential.user?.uid;

      // If successful, create a user profile in Firestore
      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'name': name,
        'email': email,
        'phoneNumber': phoneNumber,
        // Add more fields as needed
      });
      // If successful, you can add the user to the database and user model

      return 'Success'; // Return success message
    } catch (e) {
      // Handle error if signUp fails
      // For example: print(e.toString());
      return e.toString(); // Return error message
    }
  }

  Future<String?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      }
    }
    return 'Success';
  }
}
