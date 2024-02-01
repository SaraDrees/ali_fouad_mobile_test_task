import 'package:ali_fouad_app/core/app_colors.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
          child: CircularProgressIndicator(
            color: AppColors.colorPrimary,
          ));
  }
}