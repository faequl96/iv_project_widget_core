import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iv_project_core/iv_project_core.dart';

class Countdown extends StatefulWidget {
  const Countdown({super.key, required this.durationInSeconds, required this.message, this.textStyle});

  final int durationInSeconds;
  final String message;
  final TextStyle? textStyle;

  @override
  State<Countdown> createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> {
  late int _countdown;
  Timer? _timer;

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countdown == 1) {
        timer.cancel();
        NavigationService.pop(true);
      } else {
        setState(() => _countdown--);
      }
    });
  }

  @override
  void initState() {
    super.initState();

    _countdown = widget.durationInSeconds;
    _startCountdown();
  }

  @override
  void dispose() {
    _timer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.message, style: widget.textStyle ?? const TextStyle(fontWeight: .w400)),
            const SizedBox(width: 6),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: Text(
                '$_countdown',
                key: ValueKey<int>(_countdown),
                style: widget.textStyle ?? const TextStyle(fontSize: 16, fontWeight: .w800, color: AppColor.primaryColor),
              ),
            ),
            const SizedBox(width: 6),
            Text(
              AppLocalization.translate('common.seconds'),
              key: ValueKey<int>(_countdown),
              style: widget.textStyle ?? const TextStyle(fontWeight: .w800),
            ),
          ],
        ),
      ),
    );
  }
}
