import 'package:flutter/material.dart';
import 'package:iv_project_core/iv_project_core.dart';
import 'package:quick_dev_sdk/quick_dev_sdk.dart';

class ZoomImageRoute({required final Widget page}) extends PageRouteBuilder {
  this
    : super(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 400),
      );
}

class const ZoomImagePage({super.key, required final Widget image, required final String tag})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: QuickButton(
            onTap: () => Navigator.pop(context),
            style: QuickButtonStyle(
              splashColor: ColorUtil.lighten(AppColor.primaryColor),
              borderRadius: .circular(30),
            ),
            child: const Icon(Icons.arrow_back_ios_rounded, size: 28, color: Colors.white),
          ),
        ),
        body: Center(
          child: Hero(
            tag: tag,
            flightShuttleBuilder: (_, _, _, _, _) => image,
            child: InteractiveViewer(clipBehavior: .none, minScale: 1, maxScale: 4, child: image),
          ),
        ),
      ),
    );
  }
}
