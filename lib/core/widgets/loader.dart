import 'package:chat_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  final double? size;
  final Color? color;

  const Loader({
    super.key,
    this.size,
    this.color
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: size ?? 40,
        width:  size ?? 40,
        child: CircularProgressIndicator(
          color: color ?? AppColors.accentColor,
          strokeWidth: 3,
        ),
      )
    );
  }
}

class SmallLoader extends StatelessWidget {
  final Color? color;

  const SmallLoader({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
          height: 20,
          width:  20,
          child: CircularProgressIndicator(
            color: color ?? AppColors.accentColor,
            strokeWidth: 3,
          ),
        )
    );
  }
}

