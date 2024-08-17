import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/core/routes/app_routes.dart';
import 'package:task/core/theme/app_fonts.dart';
import 'package:task/core/widgets/custom_button.dart';
import 'package:task/core/widgets/custom_text_field.dart';
import 'package:task/features/auth/controllers/login_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  var controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width * 0.05),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.chat_rounded, size: context.height * 0.15),
                  Text(
                    "Login",
                    style: AppFonts.semiBoldStyle(),
                  ),
                  SizedBox(height: context.height * 0.05),
                  customTextField(
                      controller: controller.emailController,
                      hintText: "Email Address"),
                  customTextField(
                    controller: controller.passwordController,
                    hintText: "Password",
                    obsecure: true,
                  ),
                  SizedBox(height: context.height * 0.04),
                  Obx(
                    () => controller.isLoading.value
                        ? const CircularProgressIndicator()
                        : customButton(
                            context: context,
                            title: "Login",
                            press: () {
                              if (controller.formKey.currentState!.validate()) {
                                controller.login(
                                  email: controller.emailController.text,
                                  password: controller.passwordController.text,
                                );
                              }
                            },
                          ),
                  ),
                  SizedBox(height: context.height * 0.04),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: AppFonts.primaryStyle(),
                      ),
                      InkWell(
                        onTap: () {
                          Get.offAllNamed(AppRoutes.rRegisterScreen);
                        },
                        child: Text(
                          "Register",
                          style: AppFonts.semiBoldStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
