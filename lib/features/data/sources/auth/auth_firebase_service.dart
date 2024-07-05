import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/features/data/models/auth/create_user_model.dart';

abstract class AuthFirebaseService {
  Future<Either<String, CreateUserModel>> signUp(CreateUserModel model);
  Future<Either<String, User>> signIn(String email, String password);
}

class AuthFirebaseServiceImpl implements AuthFirebaseService {
  final firebase = FirebaseAuth.instance;

  @override
  Future<Either<String, CreateUserModel>> signUp(CreateUserModel model) async {
    try {
      await firebase.createUserWithEmailAndPassword(
        email: model.email,
        password: model.password,
      );
      return right(model);
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else {
        message = e.toString();
      }
      return left(message);
    }
  }

  @override
  Future<Either<String, User>> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await firebase.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(userCredential.user!);
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided.';
      } else {
        message = 'An unknown error occurred.';
      }
      return left(message);
    }
  }
}
