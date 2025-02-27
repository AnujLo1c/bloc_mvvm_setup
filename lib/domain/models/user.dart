class UserModel{
   String? token;
  bool? isLogin;

  UserModel({ required this.token,required this.isLogin});

   Map<String, dynamic> toMap() {
     return {
       'token': token,
       'isLogin': isLogin,
     };
   }

   @override
   String toString() {
     return 'UserModel{token: $token, isLogin: $isLogin}';
   }

   factory UserModel.fromMap(Map<String, dynamic> map) {
    print(map)
;     return UserModel(
       token: map['token'] as String,
       isLogin: true,
     );
   }}