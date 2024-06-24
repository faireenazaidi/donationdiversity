

import 'package:donationdiversity/UserInfo/userInfoBinding.dart';
import 'package:donationdiversity/UserInfo/userInfoView.dart';
import 'package:donationdiversity/signUp/signUp.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../Dashboard/dashboard.view.dart';
import '../Dashboard/dashboard_binding.dart';
import '../Dashboard/dashboard_binding.dart';
import '../Login/login_bining.dart';
import '../Login/login_view.dart';
import '../createPassword/password_Bining.dart';
import '../createPassword/password_View.dart';
import '../signUp/signUpBinding.dart';


class AppRoutes {
  static const String loginRoute = '/login';
  static const String signUpRoute = '/signUp';
  static const String passwordRoute = '/password';
  static const String userInfoRoute = '/userInfo';
  static const String dashboardRoute = '/dashboard';




  static List<GetPage> pages = [
    GetPage(
      name: loginRoute,
      page: () =>  const LoginView(),
      bindings: [LoginBinding()],
    ),
    GetPage(
      name: signUpRoute,
      page: () =>   SignUpView(),
      bindings: [SignBinding()],
    ),
    GetPage(
      name: passwordRoute,
      page: () =>   PasswordView(),
      bindings: [PasswordBinding()],
    ),
    GetPage(
        name: userInfoRoute,
        page:()=> UserInfoView(),
        bindings: [UserInfoBinding()]
    ),
    GetPage(
        name: dashboardRoute,
        page:()=> DashboardView(),
        bindings: [DashboardBinding()]
    ),
  ];
}
