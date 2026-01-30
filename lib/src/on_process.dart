import 'package:flutter/material.dart';
import 'dart:math' as math;

class OnProcess extends StatefulWidget {
  const OnProcess({super.key, this.message = 'Sedang memproses...'});

  final String? message;

  @override
  State<OnProcess> createState() => _OnProcessState();
}

class _OnProcessState extends State<OnProcess> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2))..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedBuilder(
          animation: _controller,
          builder: (_, child) {
            return Transform.rotate(angle: _controller.value * 2 * math.pi, child: child);
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Transform.translate(
                offset: const Offset(0, -25),
                child: const CircleAvatar(radius: 6, backgroundColor: Colors.blue),
              ),
              Transform.translate(
                offset: const Offset(0, 25),
                child: CircleAvatar(radius: 6, backgroundColor: Colors.blue.withValues(alpha: 0.5)),
              ),
              const Icon(Icons.cloud_upload_outlined, color: Colors.blue, size: 20),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Text(widget.message ?? '', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      ],
    );
  }
}
