import 'package:get/get.dart';
import 'package:task/core/middlewares/auth_middleware.dart';
import 'package:task/core/routes/app_routes.dart';
import 'package:task/features/auth/screens/login_screen.dart';
import 'package:task/features/auth/screens/register_screen.dart';
import 'package:task/features/home/screens/chat_screen.dart';
import 'package:task/features/home/screens/home_screen.dart';

List<GetPage> routes = [
  GetPage(
    name: AppRoutes.rLoginScreen,
    middlewares: [AuthMiddleWare()],
    page: () => LoginScreen(),
  ),
  GetPage(
    name: AppRoutes.rRegisterScreen,
    page: () => RegisterScreen(),
  ),
  GetPage(
    name: AppRoutes.rHomeScreen,
    page: () => HomeScreen(),
  ),
  GetPage(
    name: AppRoutes.rChatScreen,
    page: () => ChatScreen(),
  ),
];
