import 'package:flutter/material.dart';

class GeneralResponseStateDialogContent extends StatelessWidget {
  const GeneralResponseStateDialogContent.success({super.key, required this.verticalAxisContents})
    : isError = false,
      iconColor = Colors.green;
  const GeneralResponseStateDialogContent.error({super.key, this.iconColor = Colors.red, required this.verticalAxisContents})
    : isError = true;

  final bool isError;
  final Color iconColor;
  final List<Widget> verticalAxisContents;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: .min,
        children: [
          if (!isError)
            Icon(Icons.check_circle_rounded, color: iconColor, size: 64)
          else
            Icon(Icons.warning_rounded, color: iconColor, size: 64),
          const SizedBox(height: 10),
          ...verticalAxisContents,
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
