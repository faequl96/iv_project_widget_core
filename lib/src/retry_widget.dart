import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iv_project_core/iv_project_core.dart';
import 'package:quick_dev_sdk/quick_dev_sdk.dart';

class RetryWidget extends StatelessWidget {
  const RetryWidget({super.key, required this.errorMessage, required this.onRetry, this.textStyle});

  final String errorMessage;
  final void Function() onRetry;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final localeCubit = context.read<LocaleCubit>();

    return Column(
      mainAxisAlignment: .center,
      children: [
        Text(
          errorMessage,
          style: textStyle ?? const TextStyle(fontSize: 16, fontWeight: .w800, color: Colors.orange),
        ),
        const SizedBox(height: 10),
        GeneralEffectsButton(
          onTap: onRetry,
          height: 44,
          width: 132,
          borderRadius: .circular(30),
          color: AppColor.primaryColor,
          splashColor: Colors.white,
          useInitialElevation: true,
          child: Row(
            mainAxisAlignment: .center,
            children: [
              const Icon(Icons.replay_rounded, color: Colors.white),
              const SizedBox(width: 6),
              Text(
                localeCubit.state.languageCode == 'id' ? 'Coba Lagi' : 'Try Again',
                style: textStyle ?? const TextStyle(fontSize: 15, fontWeight: .w700, color: Colors.white),
              ),
              const SizedBox(width: 4),
            ],
          ),
        ),
      ],
    );
  }
}
