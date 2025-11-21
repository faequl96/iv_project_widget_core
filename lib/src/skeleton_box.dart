import 'package:flutter/material.dart';

class SkeletonBox extends StatefulWidget {
  const SkeletonBox({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = 6,
    this.enableSlider = true,
    this.sliderWidth = 60,
  });

  final double width;
  final double height;
  final double borderRadius;
  final bool enableSlider;
  final double sliderWidth;

  @override
  State<SkeletonBox> createState() => _SkeletonBoxState();
}

class _SkeletonBoxState extends State<SkeletonBox> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(duration: const Duration(milliseconds: 1200), vsync: this)..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, _) {
        final slide = _controller.value * (widget.width + widget.sliderWidth) - widget.sliderWidth;

        return ClipRRect(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              SizedBox(
                width: widget.width,
                height: widget.height,
                child: ColoredBox(color: Colors.grey.shade300),
              ),
              if (widget.enableSlider)
                Positioned(
                  left: slide,
                  child: Transform.rotate(
                    angle: .1,
                    child: SizedBox(
                      width: widget.sliderWidth,
                      height: widget.height * 10,
                      child: ColoredBox(color: Colors.grey.shade200),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
