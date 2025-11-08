import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingAnimationWidget extends StatelessWidget {
  final double? width;
  final double? height;


  const LoadingAnimationWidget({super.key, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/lotties/pikachu.json',
      width: width ?? 200,
      height: height ?? 200,
      fit: BoxFit.contain,
    );
  }
}
