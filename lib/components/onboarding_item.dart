import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingItem extends StatelessWidget {
  final String itemText;
  const OnboardingItem({super.key, required this.itemText});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset('asset/image/$itemText.svg');
  }
}
