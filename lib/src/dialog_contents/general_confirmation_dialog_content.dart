import 'package:flutter/material.dart';
import 'package:iv_project_core/iv_project_core.dart';
import 'package:iv_project_widget_core/iv_project_widget_core.dart';

class GeneralConfirmationDialogContent extends StatelessWidget {
  const GeneralConfirmationDialogContent.delete({super.key, required this.message}) : isEdit = false;
  const GeneralConfirmationDialogContent.edit({super.key, required this.message}) : isEdit = true;

  final bool isEdit;
  final Widget message;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: .min,
      children: [
        const SizedBox(height: 20),
        Padding(padding: const .symmetric(horizontal: 16), child: message),
        const SizedBox(height: 24),
        Padding(
          padding: const .symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: .center,
            children: [
              if (isEdit)
                Expanded(child: GeneralConfirmationDialogButton.edit(isCancel: true, onTap: () => NavigationService.pop(false)))
              else
                Expanded(
                  child: GeneralConfirmationDialogButton.delete(isCancel: true, onTap: () => NavigationService.pop(false)),
                ),
              const SizedBox(width: 10),
              if (isEdit)
                Expanded(child: GeneralConfirmationDialogButton.edit(isCancel: false, onTap: () => NavigationService.pop(true)))
              else
                Expanded(
                  child: GeneralConfirmationDialogButton.delete(isCancel: false, onTap: () => NavigationService.pop(true)),
                ),
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
