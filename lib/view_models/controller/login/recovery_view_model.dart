import 'package:flutter/cupertino.dart';

import '../../../res/routes/route_names.dart';

class RecoveryViewModel{
 static void resetPassword(BuildContext context, GlobalKey<FormState> formKey,
     TextEditingController textEditingController, FocusNode focusNode,) {
    if (formKey.currentState!.validate()) {
      dispose(textEditingController,focusNode);
      Navigator.pushNamed(context, RouteNames.otpView);
    }
  }

  static void dispose(TextEditingController controller, FocusNode focusNode) {
    controller.dispose();
    focusNode.dispose();
  }
}