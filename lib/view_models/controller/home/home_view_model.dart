// import 'package:get/get.dart';
// import 'package:getx_demo/domain/models/user.dart';
// import 'package:getx_demo/res/routes/route_names.dart';
//
//
// import '../../../../data/repository/login_repository.dart';
// import '../../../../utils/utils.dart';
// import '../user_shared_pref/user_shared_pref.dart';
//
// class HomeViewModel{
//
//   LoginRepository api=LoginRepository();
//     UserSharedPref userSharedPref=UserSharedPref();
//   Future<void> fetchUserDetails()async {
//     try {
//       UserModel userModel=await userSharedPref.getUser();
//       if(userModel.isLogin!){
//       dynamic res=await api.fetchUserDetails(userModel.token!);
//       print('User details : ${res}');
// Utils.toastMessage("Fetched");
//       }
//     } catch (e) {
//       print('Error getting token: $e');
// Utils.toastMessage(e.toString());
//     }
//   }
//
//   Future<void> logoutUser() async {
//  userSharedPref.removeUser().then((value) {
//    Get.toNamed(RouteNames.loginView);
//    Utils.toastMessage("Log-Out successfully");
//  },);
//   }
// }