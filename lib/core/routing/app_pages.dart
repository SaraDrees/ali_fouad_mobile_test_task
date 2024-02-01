
part of 'package:ali_fouad_app/main.dart';

class _AppPages {
  _AppPages._();

  static List<GetPage> appPages = [
    GetPage(
        name: AppRoutes.welcomePageRoute,
        page: () => const WelcomePage(),
        binding: WelcomeBinding(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500)
    ),
    GetPage(
        name: AppRoutes.loginPageRoute,
        page: () => LoginPage(),
        binding: LoginBinding(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500)
    ),
    GetPage(
        name: AppRoutes.registerPageRoute,
        page: () => RegisterPage(),
        binding: RegisterBinding(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500)
    ),
    GetPage(
        name: AppRoutes.homePageRoute,
        page: () => HomePage(),
        binding: HomeBinding(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500)
    ),
    GetPage(
        name: AppRoutes.updateInformationPageRoute,
        page: () => UpdateInformationPage(),
        binding: UpdateInformationBinding(),
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 500)
    ),
  ];
}