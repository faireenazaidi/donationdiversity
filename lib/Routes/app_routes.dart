

import 'package:donationdiversity/signUp/signUp.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../Login/login_bining.dart';
import '../Login/login_view.dart';
import '../signUp/signUpBinding.dart';


class AppRoutes {
  static const String loginRoute = '/login';
  static const String signUpRoute = '/signUp';



  static List<GetPage> pages = [




    GetPage(
      name: loginRoute,
      page: () =>  const LoginView(),
      bindings: [LoginBinding()],
    ),
    GetPage(
      name: signUpRoute,
      page: () =>  const SignUpView(),
      bindings: [SignBinding()],
    ),




  ];
}
