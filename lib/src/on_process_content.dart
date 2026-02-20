import 'package:flutter/material.dart';
import 'package:iv_project_core/iv_project_core.dart';
import 'package:quick_dev_sdk/quick_dev_sdk.dart';

class OnProcessContent extends StatefulWidget {
  const OnProcessContent({super.key, this.message});

  final String? message;

  @override
  State<OnProcessContent> createState() => _OnProcessContentState();
}

class _OnProcessContentState extends State<OnProcessContent> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500))..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: ColorConverter.lighten(AppColor.primaryColor, 92),
      child: Padding(
        padding: const .symmetric(horizontal: 40),
        child: Column(
          mainAxisSize: .min,
          children: [
            const SizedBox(height: 28),
            ScaleTransition(
              scale: Tween(begin: 0.95, end: 1.05).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut)),
              child: Stack(
                alignment: .center,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(shape: .circle, color: AppColor.primaryColor.withValues(alpha: .1)),
                  ),
                  const SizedBox(
                    width: 60,
                    height: 60,
                    child: CircularProgressIndicator(strokeWidth: 6, strokeCap: .round, color: AppColor.primaryColor),
                  ),
                  const Icon(Icons.cloud_sync_rounded, size: 32, color: AppColor.primaryColor),
                ],
              ),
            ),
            const SizedBox(height: 14),
            const Text(
              'Sedang memproses permintaan...',
              textAlign: .center,
              style: TextStyle(fontSize: 18, fontWeight: .bold),
            ),
            const SizedBox(height: 8),
            if (widget.message != null)
              Text(
                widget.message!,
                textAlign: .center,
                style: TextStyle(fontSize: 14, color: Colors.grey.shade600, height: 1.5),
              ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
