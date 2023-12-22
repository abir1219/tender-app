import 'package:get/get.dart';
import 'package:tender_app/bindings/profile_binding.dart';
import 'package:tender_app/bindings/ragistration_binding.dart';
import 'package:tender_app/res/app_pages.dart';
import 'package:tender_app/screens/dashboard.dart';
import 'package:tender_app/screens/login_screen.dart';
import 'package:tender_app/screens/profile_screen.dart';
import 'package:tender_app/screens/registration_screen.dart';
import 'package:tender_app/screens/splash_screen.dart';

import '../bindings/dashboard_bindings.dart';
import '../bindings/login_binding.dart';

class AppRoutes{
  static appRoutes () => [
    GetPage(name: AppPages.Splash,
        page: () => const SplashScreen(),
        transitionDuration: const Duration(milliseconds: 600),
        transition: Transition.leftToRightWithFade,
    ),
    GetPage(name: AppPages.Login,
        page: () => const LoginScreen(),
        transitionDuration: const Duration(milliseconds: 600),
        transition: Transition.leftToRightWithFade,
        binding: LoginBinding()
    ),
    GetPage(name: AppPages.Registration,
        page: () => const RegistrationScreen(),
        transitionDuration: const Duration(milliseconds: 600),
        transition: Transition.leftToRightWithFade,
        binding: RegistrationBinding()
    ),
    GetPage(name: AppPages.Dashboard,
        page: () => const Dashboard(),
        transitionDuration: const Duration(milliseconds: 600),
        transition: Transition.leftToRightWithFade,
        binding: DashboardBindings()
    ),
    GetPage(name: AppPages.Profile,
        page: () => const ProfileScreen(),
        transitionDuration: const Duration(milliseconds: 600),
        transition: Transition.leftToRightWithFade,
        binding: ProfileBinding()
    ),
  ];
}
