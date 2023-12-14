import 'package:get/get.dart';
import 'package:tender_app/bindings/ragistration_binding.dart';
import 'package:tender_app/res/app_pages.dart';
import 'package:tender_app/screens/login_screen.dart';
import 'package:tender_app/screens/registration_screen.dart';

import '../bindings/login_binding.dart';

class AppRoutes{
  static appRoutes () => [
    GetPage(name: AppPages.Login,
        page: () => const LoginScreen(),
        transitionDuration: const Duration(milliseconds: 800),
        transition: Transition.leftToRightWithFade,
        binding: LoginBinding()
    ),
    GetPage(name: AppPages.Registration,
        page: () => const RegistrationScreen(),
        transitionDuration: const Duration(milliseconds: 800),
        transition: Transition.leftToRightWithFade,
        binding: RegistrationBinding()
    ),
  ];
}
