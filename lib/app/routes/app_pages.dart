import 'package:get/get.dart';

import '../modules/create_event/bindings/create_event_binding.dart';
import '../modules/create_event/views/create_event_view.dart';
import '../modules/creator_registration/bindings/creator_registration_binding.dart';
import '../modules/creator_registration/views/creator_registration_view.dart';
import '../modules/email_verification/bindings/email_verification_binding.dart';
import '../modules/email_verification/views/email_verification_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/menu_screen/bindings/menu_screen_binding.dart';
import '../modules/menu_screen/views/menu_screen_view.dart';
import '../modules/select_role/bindings/select_role_binding.dart';
import '../modules/select_role/views/select_role_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';
import '../modules/talent_registration/bindings/talent_registration_binding.dart';
import '../modules/talent_registration/views/talent_registration_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.EMAIL_VERIFICATION,
      page: () => const EmailVerificationView(),
      binding: EmailVerificationBinding(),
    ),
    GetPage(
      name: _Paths.SELECT_ROLE,
      page: () => const SelectRoleView(),
      binding: SelectRoleBinding(),
    ),
    GetPage(
      name: _Paths.CREATOR_REGISTRATION,
      page: () => const CreatorRegistrationView(),
      binding: CreatorRegistrationBinding(),
    ),
    GetPage(
      name: _Paths.TALENT_REGISTRATION,
      page: () => const TalentRegistrationView(),
      binding: TalentRegistrationBinding(),
    ),
    GetPage(
      name: _Paths.MENU_SCREEN,
      page: () => const MenuScreenView(),
      binding: MenuScreenBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_EVENT,
      page: () => const CreateEventView(),
      binding: CreateEventBinding(),
    ),
  ];
}
