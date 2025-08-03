import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  final Widget child;
  final double? elevation;
  final double? height;
  final double? width;

  final void Function()? onTap;

  CustomCardWidget({
    required this.child,
    this.elevation,
    this.height,
    this.width,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 0,

        // elevation: elevation == null ? 5 : elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          height: height,
          width: width,
          child: child,
        ),
      ),
    );
  }
}
