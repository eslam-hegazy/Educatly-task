import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/core/utils/alerts.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // login user
  var isLoading = false.obs;
  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      isLoading.value = true;
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      isLoading.value = false;
    } on FirebaseAuthException catch (e) {
      getSnackBar(typeSnackBar: TypeSnackBar.error, text: e.message);
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
    }
  }
}
