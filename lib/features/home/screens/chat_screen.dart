import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/core/theme/app_colors.dart';
import 'package:task/core/theme/app_fonts.dart';
import 'package:task/core/utils/functions.dart';
import 'package:task/core/widgets/custom_text_field.dart';
import 'package:task/features/home/controllers/chat_controller.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  var controller = Get.put(ChatController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.primaryColor,
      appBar: AppBar(
        title: Text(controller.user['name']),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: CircleAvatar(
              child: Icon(Icons.person),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => controller.messagesData.isEmpty
                  ? Center(
                      child: Text(
                        "No Messages Yet",
                        style: AppFonts.regularStyle(fontSize: 15),
                      ),
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      itemBuilder: (_, index) {
                        var data = controller.messagesData[index];
                        var currentUser = FirebaseAuth.instance.currentUser;
                        var timestamp = data['createAt'] as Timestamp;

                        if (currentUser!.uid == data['senderId']) {
                          return sentMessage(
                            context: context,
                            message: data['text'],
                            time: formatMessageTime(timestamp: timestamp),
                          );
                        } else {
                          return reciveMessage(
                            context: context,
                            message: data['text'],
                            time: formatMessageTime(timestamp: timestamp),
                          );
                        }
                      },
                      separatorBuilder: (_, index) =>
                          const SizedBox(height: 15),
                      itemCount: controller.messagesData.length,
                    ),
            ),
          ),
          _buildMessage(),
        ],
      ),
    );
  }

  Widget sentMessage({
    required BuildContext context,
    required String message,
    required String time,
  }) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
            color: AppColors.primaryColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                message,
                style: AppFonts.regularStyle(
                    fontSize: 16, color: AppColors.whiteColor),
              ),
              Text(
                time,
                style: AppFonts.regularStyle(
                    fontSize: 10, color: AppColors.grey3Color),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget reciveMessage({
    required BuildContext context,
    required String message,
    required String time,
  }) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15)),
            color: AppColors.grey8Color,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message,
                style: AppFonts.regularStyle(
                    fontSize: 14, color: AppColors.whiteColor),
              ),
              Text(
                time,
                style: AppFonts.regularStyle(
                    fontSize: 10, color: AppColors.grey3Color),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMessage() {
    return Row(
      children: [
        Expanded(
          child: customTextField(
            controller: controller.messageController,
            hintText: "Enter Message",
          ),
        ),
        IconButton(
          icon: const CircleAvatar(
            backgroundColor: AppColors.blueColor,
            child: Icon(Icons.send),
          ),
          onPressed: () {
            if (controller.messageController.text.isNotEmpty) {
              controller.sendMessage(
                message: controller.messageController.text,
                reciverId: controller.user['uid'],
              );
            }
          },
        ),
      ],
    );
  }
}
