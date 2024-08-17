import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/core/routes/app_routes.dart';
import 'package:task/core/theme/app_colors.dart';
import 'package:task/core/theme/app_fonts.dart';
import 'package:task/features/home/controllers/home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  var controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.primaryColor,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.logout),
        onPressed: () {
          controller.logout();
        },
      ),
      appBar: AppBar(
        title: const Text("Chats"),
        actions: [
          IconButton(
            onPressed: () {
            Get.isDarkMode?  Get.changeThemeMode(ThemeMode.light):Get.changeThemeMode(ThemeMode.dark);
            },
            icon: const Icon(Icons.light_mode),
          ),
        ],
      ),
      body: Obx(
        () => ListView.separated(
          padding: const EdgeInsets.all(10),
          itemBuilder: (_, index) {
            return ListTile(
              onTap: () {
                Get.toNamed(AppRoutes.rChatScreen,
                    arguments: [controller.usersData[index]]);
              },
              leading: const CircleAvatar(
                child: Icon(Icons.person),
              ),
              title: Text(controller.usersData[index]['name']),
              subtitle: Text(
                controller.usersData[index]['email'],
                style: AppFonts.regularStyle(color: AppColors.grey5Color),
              ),
            );
          },
          separatorBuilder: (_, index) => const Divider(),
          itemCount: controller.usersData.length,
        ),
      ),
    );
  }
}
