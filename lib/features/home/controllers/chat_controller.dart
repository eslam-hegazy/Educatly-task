import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController messageController = TextEditingController();
  StreamSubscription<QuerySnapshot>? _streamMessages;
  late Map<String, dynamic> user;
  @override
  void onInit() {
    user = Get.arguments[0];
    getMessages(reciverId: user['uid']);
    super.onInit();
  }

  @override
  void dispose() {
    _streamMessages?.cancel();
    super.dispose();
  }

  // send message
  Future<void> sendMessage({
    required String message,
    required String reciverId,
  }) async {
    var currentUser = FirebaseAuth.instance.currentUser;
    await _firestore
        .collection('users')
        .doc(currentUser!.uid)
        .collection("chat")
        .doc(reciverId)
        .collection('messages')
        .add({
      'text': message,
      'senderId': currentUser.uid,
      'reciverId': reciverId,
      'createAt': DateTime.now(),
    });
    messageController.text = "";
  }

  // get messages
  var messagesData = <Map<String, dynamic>>[].obs;
  void getMessages({required String reciverId}) async {
    var currentUser = FirebaseAuth.instance.currentUser;
    _streamMessages = _firestore
        .collection("users")
        .doc(currentUser!.uid)
        .collection("chat")
        .doc(reciverId)
        .collection("messages")
        .orderBy('createAt')
        .snapshots()
        .listen((QuerySnapshot querySnapshot) {
      List<Map<String, dynamic>> fetchedData = [];
      for (var doc in querySnapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        fetchedData.add(data);
      }
      messagesData.value = fetchedData;
    });
  }
}
