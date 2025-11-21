import 'package:flutter/material.dart';
import 'package:iv_project_widget_core/iv_project_widget_core.dart';
import 'package:quick_dev_sdk/quick_dev_sdk.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    required this.title,
    this.height = 52,
    required this.color,
    this.isDisabled = false,
    this.isBusy = false,
    this.isLoading = false,
    required this.onTap,
  }) : margin = EdgeInsets.zero;

  const DefaultButton.dialog({
    super.key,
    required this.title,
    this.margin = const EdgeInsets.only(top: 14, left: 14, right: 14, bottom: 20),
    required this.color,
    this.isDisabled = false,
    this.isBusy = false,
    this.isLoading = false,
    required this.onTap,
  }) : height = 52;

  final String title;
  final double height;
  final EdgeInsets margin;
  final Color color;
  final bool isDisabled;
  final bool isBusy;
  final bool isLoading;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: GeneralEffectsButton(
        onTap: onTap,
        isDisabled: isBusy || isDisabled,
        height: height,
        color: color,
        splashColor: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(40),
        useInitialElevation: true,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isLoading) ...[SharedPersonalize.loadingWidget(size: 16, color: Colors.white), const SizedBox(width: 10)],
            Text(
              title,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
