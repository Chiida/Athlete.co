import 'package:apple_sign_in/apple_sign_in.dart';
import 'package:attt/utils/appleSignInAvailable/AppleSignInAvailable.dart';
import 'package:attt/view_model/signInViewModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthService {
  final _firebaseAuth = FirebaseAuth.instance;

  Future<User> signInWithApple({List<Scope> scopes = const []}) async {
    /// perform the sign in request
    final result = await AppleSignIn.performRequests(
        [AppleIdRequest(requestedScopes: scopes)]);

    /// check the result
    switch (result.status) {
      case AuthorizationStatus.authorized:
        final appleIDCredential = result.credential;
        final oAuthProvider = OAuthProvider('apple.com');
        final credential = oAuthProvider.credential(
            idToken: String.fromCharCodes(appleIDCredential.identityToken),
            accessToken:
                String.fromCharCodes(appleIDCredential.authorizationCode));
        final authResult = await _firebaseAuth.signInWithCredential(credential);
        final firebaseUser = authResult.user;
        if (scopes.contains(Scope.fullName)) {
          final updateUser = FirebaseAuth.instance.currentUser.updateProfile(
              displayName:
                  '${appleIDCredential.fullName.givenName} ${appleIDCredential.fullName.familyName}');
          // updateUser(displayName:) = '${appleIDCredential.fullName.givenName} ${appleIDCredential.fullName.familyName}';
          await firebaseUser.updateProfile();
        }

        return firebaseUser;
      case AuthorizationStatus.error:
        print(result.error.toString());
        throw PlatformException(
          code: 'ERROR_AUTHORIZATION_DENIED',
          message: result.error.toString(),
        );
      case AuthorizationStatus.cancelled:
        throw PlatformException(
          code: 'ERROR_ABORTED_BY_USER',
          message: 'Sign in aborted by user',
        );
    }
    return null;
  }
}
