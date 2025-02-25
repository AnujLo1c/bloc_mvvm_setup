import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogoutDialog extends StatelessWidget {
  final VoidCallback onConfirm;
  final String title;
  final String desc;

  const LogoutDialog({super.key, required this.onConfirm, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      title: Text(title),
      content: Text(desc),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: const Text("No"),
        ),
        TextButton(
          onPressed: () {
            Get.back();
            onConfirm();
          },
          child: const Text("Yes"),
        ),
      ],
    );
  }
}
