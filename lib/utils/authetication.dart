import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authetication {
  static final Authenticator email = _Email();
  static final Authenticator google = _Google();
  static final Authenticator guest = _Guest();
}

abstract class Authenticator {
  ///Sign-in process.
  ///Use [email] and [password] only for email authentication.
  Future<UserCredential> tryLogin([String? email, String? password]);

  ///Singup process.
  ///Use [email] and [password] only for email authentication.
  Future<UserCredential> trySingup([String? email, String? password]);
}

class _Email extends Authenticator {
  @override
  Future<UserCredential> trySingup([String? email, String? password]) async {
    if (email == null || password == null) {
      /// Email auth need email and password
      throw Error();
    }
    return await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<UserCredential> tryLogin([String? email, String? password]) async {
    if (email == null || password == null) {
      /// Email auth need email and password
      throw Error();
    }
    return await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }
}

class _Google extends Authenticator {
  Future<UserCredential> authFlow() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Future<UserCredential> trySingup([String? email, String? password]) {
    return authFlow();
  }

  @override
  Future<UserCredential> tryLogin([String? email, String? password]) {
    return authFlow();
  }
}

class _Guest extends Authenticator {
  @override
  Future<UserCredential> trySingup([String? email, String? password]) async {
    return await FirebaseAuth.instance.signInAnonymously();
  }

  @override
  Future<UserCredential> tryLogin([String? email, String? password]) {
    ///Guest account can't sing-in
    throw Error();
  }
}
