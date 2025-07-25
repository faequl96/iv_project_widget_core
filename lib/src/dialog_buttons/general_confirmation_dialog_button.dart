import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iv_project_core/iv_project_core.dart';
import 'package:iv_project_widget_core/iv_project_widget_core.dart';
import 'package:quick_dev_sdk/quick_dev_sdk.dart';

class GeneralConfirmationDialogButton extends StatelessWidget {
  const GeneralConfirmationDialogButton.delete({super.key, required this.isCancel, required this.onTap}) : isEdit = false;
  const GeneralConfirmationDialogButton.edit({super.key, required this.isCancel, required this.onTap}) : isEdit = true;

  final bool isEdit;
  final bool isCancel;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BusyCubit, bool>(
      builder: (_, isBusy) => GeneralEffectsButton(
        onTap: onTap,
        isDisabled: isBusy,
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(vertical: 12),
        color: isCancel
            ? Colors.white
            : isEdit
            ? ColorConverter.lighten(Colors.blue)
            : ColorConverter.lighten(Colors.red),
        borderRadius: BorderRadius.circular(10),
        border: isCancel
            ? Border.all(width: 2, color: isEdit ? ColorConverter.lighten(Colors.blue) : ColorConverter.lighten(Colors.red))
            : null,
        useInitialElevation: true,
        hoveredElevation: 3,
        child: SharedPersonalize.buttonText(
          isCancel ? AppLocalization.translate('common.cancel') : AppLocalization.translate('common.confirm'),
          fontSize: 15,
          color: isCancel
              ? isEdit
                    ? ColorConverter.lighten(Colors.blue)
                    : ColorConverter.lighten(Colors.red)
              : null,
        ),
      ),
    );
  }
}
