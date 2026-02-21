import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iv_project_core/iv_project_core.dart';
import 'package:iv_project_widget_core/iv_project_widget_core.dart';
import 'package:iv_project_widget_core/src/on_process_content.dart';
import 'package:quick_dev_sdk/quick_dev_sdk.dart';

class GeneralDialog {
  GeneralDialog._();

  static Future<T> showSuccess<T>(Widget content) async {
    final completer = Completer<T>();

    ShowModal.bottomSheet<T>(
      GlobalContextService.value,
      dismissible: false,
      enableDrag: false,
      header: BottomSheetHeader(
        action: HeaderAction(actionIcon: Icons.close, onTap: () => NavigationService.pop()),
      ),
      decoration: BottomSheetDecoration(
        borderRadius: const .only(topLeft: .circular(24), topRight: .circular(24)),
      ),
      wallpapers: ShowModal.builtInWallpapers(),
      contentBuilder: (_) => content,
    ).then((value) {
      completer.complete(value);
    });

    return await completer.future;
  }

  static Future<T> showError<T>(Widget content) async {
    final completer = Completer<T>();

    ShowModal.bottomSheet<T>(
      GlobalContextService.value,
      dismissible: false,
      enableDrag: false,
      header: BottomSheetHeader(
        action: HeaderAction(actionIcon: Icons.close, onTap: () => NavigationService.pop()),
      ),
      decoration: BottomSheetDecoration(
        borderRadius: const .only(topLeft: .circular(24), topRight: .circular(24)),
      ),
      wallpapers: ShowModal.builtInWallpapers(isError: true),
      contentBuilder: (_) => content,
    ).then((value) {
      completer.complete(value);
    });

    return await completer.future;
  }

  static void showResponseStateSuccess(String message, {TextStyle? textStyle}) {
    showSuccess(
      GeneralResponseStateDialogContent.success(
        verticalAxisContents: [
          Text(message, style: textStyle ?? const TextStyle(fontSize: 15, fontWeight: .w800)),
          const SizedBox(height: 10),
          Countdown(durationInSeconds: 5, message: AppLocalization.translate('transaction.autoCloseIn')),
        ],
      ),
    );
  }

  static void showResponseStateError(String message) {
    showError(
      GeneralResponseStateDialogContent.error(
        verticalAxisContents: [
          Text(message, style: const TextStyle(fontSize: 15, fontWeight: .bold)),
          const SizedBox(height: 10),
          Countdown(durationInSeconds: 5, message: AppLocalization.translate('transaction.autoCloseIn')),
        ],
      ),
    );
  }

  static void showValidateStateError(String message, {int durationInSeconds = 3}) {
    showError(
      GeneralResponseStateDialogContent.error(
        iconColor: Colors.orange,
        verticalAxisContents: [
          Text(
            message,
            style: const TextStyle(fontSize: 15, fontWeight: .bold),
            textAlign: .center,
          ),
          const SizedBox(height: 10),
          Countdown(durationInSeconds: durationInSeconds, message: AppLocalization.translate('transaction.autoCloseIn')),
        ],
      ),
    );
  }

  static Future<bool?> showDeleteConfirmation(String itemName) async {
    final completer = Completer<bool?>();

    ShowModal.bottomSheet<bool?>(
      GlobalContextService.value,
      decoration: BottomSheetDecoration(
        color: ColorConverter.lighten(AppColor.primaryColor, 94),
        borderRadius: const .only(topLeft: .circular(24), topRight: .circular(24)),
      ),
      header: const BottomSheetHeader(title: .handleBar()),
      contentBuilder: (_) => GeneralConfirmationDialogContent.delete(
        message: Text.rich(
          TextSpan(
            children: [
              TextSpan(text: AppLocalization.translate('ivCoreDialog.deleteConfirmation')),
              const TextSpan(text: ' '),
              TextSpan(
                text: itemName,
                style: const TextStyle(fontWeight: .bold),
              ),
            ],
          ),
          style: const TextStyle(fontSize: 15),
          textAlign: .center,
        ),
      ),
    ).then((value) {
      completer.complete(value);
    });

    return await completer.future;
  }

  static Future<void> showOnProcess({String? message}) async {
    final completer = Completer<void>();

    ShowModal.bottomSheet<void>(
      GlobalContextService.value,
      dismissible: false,
      canPop: false,
      enableDrag: false,
      decoration: BottomSheetDecoration(
        color: ColorConverter.lighten(AppColor.primaryColor, 94),
        borderRadius: const .only(topLeft: .circular(24), topRight: .circular(24)),
      ),
      contentBuilder: (_) => OnProcessContent(message: message),
    ).then((_) {
      completer.complete();
    });

    return await completer.future;
  }
}
