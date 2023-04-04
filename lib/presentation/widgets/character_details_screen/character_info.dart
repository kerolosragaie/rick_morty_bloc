import 'package:flutter/material.dart';
import 'package:rick_morty_bloc/core/constants/app_colors.dart';

class CharacterInfo extends StatelessWidget {
  final String title;
  final String value;
  const CharacterInfo({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(
              color: AppColors.text,
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
              color: AppColors.text,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
