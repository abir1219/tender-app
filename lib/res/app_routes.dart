import 'package:get/get.dart';
import 'package:tender_app/bindings/ragistration_binding.dart';
import 'package:tender_app/res/app_pages.dart';
import 'package:tender_app/screens/login_screen.dart';
import 'package:tender_app/screens/registration_screen.dart';

import '../bindings/login_binding.dart';

List<GetPage> AppRoutes = [
  GetPage(name: AppPages.Login,
      page: () => const LoginScreen(),
      binding: LoginBinding()
  ),
  GetPage(name: AppPages.Registration,
      page: () => const RegistrationScreen(),
      binding: RegistrationBinding()
  ),
];