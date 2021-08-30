import 'dart:ffi';

import 'package:google_sign_in/google_sign_in.dart';

class LoginController {
  Future<void> googleSingIn() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    try {
      final response = await _googleSignIn.signIn();
      print(response);
    } catch (error) {
      print(error);
    }
  }
}
