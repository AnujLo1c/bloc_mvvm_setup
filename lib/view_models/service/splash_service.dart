// import 'dart:async';
//
// import 'package:get/get.dart';
//
// import 'package:getx_demo/view_models/controller/user_shared_pref/user_shared_pref.dart';
//
// import '../../res/routes/route_names.dart';
//
// class SplashService {
//   UserSharedPref userPreference = UserSharedPref();
//
//   void isLogin() {
//     userPreference.getUser().then((value) {
//       Timer(const Duration(seconds: 3), () {
//         if (value.isLogin == false || value.isLogin.toString() == 'null') {
//           Get.toNamed(RouteNames.loginView);
//         } else {
//           Get.toNamed(RouteNames.homeView);
//         }
//       });
//     });
//   }
// }
