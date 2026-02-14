import 'package:flutter/material.dart';
import 'package:iv_project_core/iv_project_core.dart';
import 'package:quick_dev_sdk/quick_dev_sdk.dart';

class SharedPersonalize {
  SharedPersonalize._();

  static HeaderAction headerActionClose(BuildContext context) {
    return HeaderAction(actionIcon: Icons.close, onHoverIconColor: Colors.red, onTap: () => Navigator.pop(context));
  }

  static final bottomSheetDecoration = BottomSheetDecoration(
    borderRadius: const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
  );

  static final dialogDecoration = DialogDecoration(borderRadius: BorderRadius.circular(14));

  static PreSufFixIcon suffixClear(void Function() onTap, {Color? color, Color? iconColor}) {
    return PreSufFixIcon(
      onTap: () => onTap(),
      backgroundColor: color ?? Colors.grey.shade400,
      splashColor: Colors.white,
      child: Icon(Icons.close, size: 20, color: iconColor ?? Colors.white),
    );
  }

  static final suffixMandatory = PreSufFixIcon(
    onTap: () {},
    child: SizedBox(
      width: 24,
      height: 24,
      child: Center(
        child: SizedBox(
          width: 14,
          height: 14,
          child: Text(
            '*',
            textAlign: TextAlign.center,
            style: AppFonts.nunito(fontSize: 22, height: 1, color: ColorConverter.lighten(Colors.red), fontWeight: .w800),
          ),
        ),
      ),
    ),
  );

  static TextFieldValidator fieldCanNotEmpty({String? message}) {
    return TextFieldValidator.failed(
      message: Text(
        message ?? AppLocalization.translate('auth.error.validation.cannotBeEmpty'),
        style: AppFonts.nunito(color: Colors.red),
      ),
    );
  }

  static TextFieldValidator fieldEmailNotValid() {
    return TextFieldValidator.failed(
      message: Text(AppLocalization.translate('auth.error.validation.invalidEmail'), style: AppFonts.nunito(color: Colors.red)),
    );
  }

  static Text buttonText(String text, {double? fontSize, Color? color}) => Text(
    text,
    textAlign: TextAlign.center,
    style: AppFonts.nunito(fontWeight: .w800, color: color ?? Colors.white, fontSize: fontSize),
  );

  static TextStyle titleTextStyle({Color? color}) => AppFonts.nunito(fontWeight: .w800, fontSize: 16, color: color);

  static Widget loadingWidget({double size = 28, Color? color}) => SizedBox(
    width: size,
    height: size,
    child: CircularProgressIndicator(strokeWidth: size / 5.2, color: color ?? Theme.of(GlobalContextService.value).primaryColor),
  );
}
