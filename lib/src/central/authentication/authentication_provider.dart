import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../models/user_model.dart';
import '../../providers/user_provider.dart';
import '../app_route/app_route.dart';
import '../widgets/my_snackbar.dart';
import 'package:provider/provider.dart';

import '../services/my_logger.dart';

class AuthenticationProvider with ChangeNotifier {
  late final GoogleSignIn googleSignIn = GoogleSignIn();
  bool isLoading = false;

  Future<User?> signInWithGoogle(BuildContext context) async {
    logger.d("in signInWithGoogle");
    setLoading(true);
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    // UserProvider userProvider =
    //     Provider.of<UserProvider>(context, listen: false);

    if (kIsWeb) {
      GoogleAuthProvider authProvider = GoogleAuthProvider();

      try {
        final UserCredential userCredential =
            await auth.signInWithPopup(authProvider);

        return user = userCredential.user;

        // StudentModel.fromJson(user);
      } catch (e) {
        debugPrint(e.toString());
      }
    } else {
      // final GoogleSignIn googleSignIn = GoogleSignIn();

      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleUser.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        try {
          final UserCredential userCredential =
              await auth.signInWithCredential(credential);

          return user = userCredential.user;
          // userCtrl.userId = user!.uid;
          // inspect(user);
          // feedData(user!, userProvider);
        } on FirebaseAuthException catch (e) {
          if (e.code == 'account-exists-with-different-credential') {
            ScaffoldMessenger.of(context).showSnackBar(
              mySnackBar(
                content:
                    'The account already exists with a different credential.',
              ),
            );
          } else if (e.code == 'invalid-credential') {
            ScaffoldMessenger.of(context).showSnackBar(
              mySnackBar(
                content:
                    'Error occurred while accessing credentials. Try again.',
              ),
            );
          }
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            mySnackBar(
              content: 'Error occurred using Google Sign-In. Try again.',
            ),
          );
        } finally {
          setLoading(false);
        }
      }
      setLoading(false);
      return user;
    }
    return null;
  }

  setLoading(bool status) {
    isLoading = status;
    notifyListeners();
  }

  Future<void> _signOut(BuildContext context) async {
    try {
      if (!kIsWeb) {
        await googleSignIn.signOut();
      }
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        mySnackBar(
          content: 'Error signing out. Try again.',
        ),
      );
    }
  }

  signOut(BuildContext context) async {
    await _signOut(context);
    context.read<UserProvider>().userModel = UserModel();
  }
}
