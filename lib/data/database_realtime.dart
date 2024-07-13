import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:thflutter/models/account.dart';

class DataBaseRealtime {
  static DataBaseRealtime? _instance;
  DataBaseRealtime._internal();
  FirebaseDatabase database = FirebaseDatabase.instance;

  Account account = Account();

  static DataBaseRealtime get instance {
    _instance ??= DataBaseRealtime._internal();
    return _instance!;
  }

  String hashPassword(String password) {
    var bytes = utf8.encode(password);
    var digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<bool> login({required String email, required String password}) async {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    User? user = userCredential.user;

    if (user != null) {
      final DatabaseReference userRef =
          await database.ref().child('users/${userCredential.user!.uid}');
      DatabaseEvent event = await userRef.once();
      account.name = event.snapshot.child('name').value.toString();
      account.uid = user.uid;
      account.email = email;
      return true;
    }
    return false;
  }

  Future<bool> register({
    required String email,
    required String username,
    required String password,
  }) async {
    log(email);
    log(password);

    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    User? user = userCredential.user;

    if (user != null) {
      await database.ref().child('users/${user.uid}').set({
        'email': email,
        'password': hashPassword(password),
        'username': username
      });
      return true;
    }
    return false;
  }
}
