import 'package:flutter/material.dart';

class GFToast extends StatelessWidget {
  final String text;
  final bool autoDismiss;

  const GFToast({
    Key? key,
    required this.text,
    this.autoDismiss = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      if (autoDismiss) {
        Future.delayed(const Duration(seconds: 2), () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        });
      }
    });

    // Return an empty Container
    return Container();
  }
}
