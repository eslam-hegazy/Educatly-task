import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task/core/routes/app_routes.dart';
import 'package:task/core/utils/alerts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // register user
  var isLoading = false.obs;
  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      isLoading.value = true;
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      if (user != null) {
        // Add user data to Firestore
        await _firestore.collection('users').doc(user.uid).set({
          'name': name,
          'email': email,
          'uid': user.uid,
          'createdAt': FieldValue.serverTimestamp(),
        }).then(
          (value) => Get.offAllNamed(AppRoutes.rHomeScreen),
        );
      }

      isLoading.value = false;
    } on FirebaseAuthException catch (e) {
      getSnackBar(typeSnackBar: TypeSnackBar.error, text: e.message);
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
    }
  }
}
