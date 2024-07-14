import 'package:get/get.dart';

import '../modules/chat_detail/bindings/chat_detail_binding.dart';
import '../modules/chat_detail/views/chat_detail_view.dart';
import '../modules/checkin_event/bindings/checkin_event_binding.dart';
import '../modules/checkin_event/views/checkin_event_view.dart';
import '../modules/create_event/bindings/create_event_binding.dart';
import '../modules/create_event/views/create_event_view.dart';
import '../modules/create_lowongan/bindings/create_lowongan_binding.dart';
import '../modules/create_lowongan/views/create_lowongan_view.dart';
import '../modules/create_venue/bindings/create_venue_binding.dart';
import '../modules/create_venue/views/create_venue_view.dart';
import '../modules/creator_registration/bindings/creator_registration_binding.dart';
import '../modules/creator_registration/views/creator_registration_view.dart';
import '../modules/detail_pesanan/bindings/detail_pesanan_binding.dart';
import '../modules/detail_pesanan/views/detail_pesanan_view.dart';
import '../modules/email_verification/bindings/email_verification_binding.dart';
import '../modules/email_verification/views/email_verification_view.dart';
import '../modules/event/bindings/event_binding.dart';
import '../modules/event/views/event_view.dart';
import '../modules/event_detail/bindings/event_detail_binding.dart';
import '../modules/event_detail/views/event_detail_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home_item/bindings/home_item_binding.dart';
import '../modules/home_item/views/home_item_view.dart';
import '../modules/jual_tiket_offline/bindings/jual_tiket_offline_binding.dart';
import '../modules/jual_tiket_offline/views/jual_tiket_offline_view.dart';
import '../modules/jual_tiket_offline_list/bindings/jual_tiket_offline_list_binding.dart';
import '../modules/jual_tiket_offline_list/views/jual_tiket_offline_list_view.dart';
import '../modules/kelola_item/bindings/kelola_item_binding.dart';
import '../modules/kelola_item/views/kelola_item_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/menu_screen/bindings/menu_screen_binding.dart';
import '../modules/menu_screen/views/menu_screen_view.dart';
import '../modules/notifikasi_item/bindings/notifikasi_item_binding.dart';
import '../modules/notifikasi_item/views/notifikasi_item_view.dart';
import '../modules/pembayaran/bindings/pembayaran_binding.dart';
import '../modules/pembayaran/views/pembayaran_view.dart';
import '../modules/pesan_item/bindings/pesan_item_binding.dart';
import '../modules/pesan_item/views/pesan_item_view.dart';
import '../modules/profile_item/bindings/profile_item_binding.dart';
import '../modules/profile_item/views/profile_item_view.dart';
import '../modules/scan/bindings/scan_binding.dart';
import '../modules/scan/views/scan_view.dart';
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
    GetPage(
      name: _Paths.HOME_ITEM,
      page: () => const HomeItemView(),
      binding: HomeItemBinding(),
    ),
    GetPage(
      name: _Paths.KELOLA_ITEM,
      page: () => const KelolaItemView(),
      binding: KelolaItemBinding(),
    ),
    GetPage(
      name: _Paths.PESAN_ITEM,
      page: () => const PesanItemView(),
      binding: PesanItemBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFIKASI_ITEM,
      page: () => const NotifikasiItemView(),
      binding: NotifikasiItemBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_ITEM,
      page: () => const ProfileItemView(),
      binding: ProfileItemBinding(),
    ),
    GetPage(
      name: _Paths.EVENT,
      page: () => const EventView(),
      binding: EventBinding(),
    ),
    GetPage(
      name: _Paths.EVENT_DETAIL,
      page: () => const EventDetailView(),
      binding: EventDetailBinding(),
    ),
    GetPage(
      name: _Paths.CHAT_DETAIL,
      page: () => const ChatDetailView(),
      binding: ChatDetailBinding(),
    ),
    GetPage(
      name: _Paths.SCAN,
      page: () => const ScanView(),
      binding: ScanBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_LOWONGAN,
      page: () => const CreateLowonganView(),
      binding: CreateLowonganBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_VENUE,
      page: () => const CreateVenueView(),
      binding: CreateVenueBinding(),
    ),
    GetPage(
      name: _Paths.CHECKIN_EVENT,
      page: () => const CheckinEventView(),
      binding: CheckinEventBinding(),
    ),
    GetPage(
      name: _Paths.JUAL_TIKET_OFFLINE,
      page: () => const JualTiketOfflineView(),
      binding: JualTiketOfflineBinding(),
    ),
    GetPage(
      name: _Paths.JUAL_TIKET_OFFLINE_LIST,
      page: () => const JualTiketOfflineListView(),
      binding: JualTiketOfflineListBinding(),
    ),
    GetPage(
      name: _Paths.PEMBAYARAN,
      page: () => const PembayaranView(),
      binding: PembayaranBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_PESANAN,
      page: () => const DetailPesananView(),
      binding: DetailPesananBinding(),
    ),
  ];
}
