import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iv_project_core/iv_project_core.dart';

class GeneralIVCoreSummary extends StatelessWidget {
  const GeneralIVCoreSummary({super.key, required this.id, required this.name});

  final int id;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(width: 14),
            const Text('ID'),
            const Spacer(),
            Text('$id', style: const TextStyle(fontWeight: FontWeight.bold, color: AppColor.primaryColor)),
            const SizedBox(width: 14),
          ],
        ),
        Row(
          children: [
            const SizedBox(width: 14),
            BlocBuilder<LocaleCubit, Locale>(builder: (_, _) => Text(AppLocalization.translate('common.name'))),
            const Spacer(),
            Text(name, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade700)),
            const SizedBox(width: 14),
          ],
        ),
      ],
    );
  }
}
