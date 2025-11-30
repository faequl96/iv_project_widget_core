import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iv_project_core/iv_project_core.dart';
import 'package:quick_dev_sdk/quick_dev_sdk.dart';

class RetryWidget extends StatelessWidget {
  const RetryWidget({super.key, required this.errorMessage, required this.onRetry});

  final String errorMessage;
  final void Function() onRetry;

  @override
  Widget build(BuildContext context) {
    final localeCubit = context.read<LocaleCubit>();

    return Column(
      mainAxisAlignment: .center,
      children: [
        Text(
          errorMessage,
          style: AppFonts.nunito(fontSize: 16, fontWeight: .bold, color: Colors.orange),
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
                style: AppFonts.nunito(fontSize: 15, fontWeight: .bold, color: Colors.white),
              ),
              const SizedBox(width: 4),
            ],
          ),
        ),
      ],
    );
  }
}
