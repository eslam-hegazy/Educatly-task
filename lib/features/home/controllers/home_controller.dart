import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:task/core/routes/app_routes.dart';

class HomeController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  StreamSubscription<QuerySnapshot>? _streamUsers;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void onInit() {
    getAllUsers();
    super.onInit();
  }

  @override
  void dispose() {
    _streamUsers?.cancel();
    super.dispose();
  }
  // logout
  Future<void> logout() async {
    try {
      await _auth.signOut();
      Get.offAllNamed(AppRoutes.rLoginScreen);
    } catch (e) {
      print(e);
    }
  }

  // get all users
  var usersData=<Map<String, dynamic>>[].obs;
  var isLoading = false.obs;
  Future<void> getAllUsers() async {
    var currentUser = FirebaseAuth.instance.currentUser;
    _streamUsers = _firestore
        .collection('users')
        .snapshots()
        .listen((QuerySnapshot querySnapshot) {
      isLoading.value = true;
      List<Map<String, dynamic>> fetchedData = [];
      for (var doc in querySnapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        if (data['uid'] != currentUser!.uid) {
          fetchedData.add(data);
        }
      }
      usersData.value=fetchedData;
      isLoading.value = false;
    });
  }
}
