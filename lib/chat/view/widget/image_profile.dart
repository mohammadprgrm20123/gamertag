import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../infrastructure/theme/app_color.dart';
import '../../../infrastructure/utils/utils.dart';
import '../../../share/widget/app_text.dart';

class ProfileImage extends StatelessWidget {
  final String image;
  final String name;

  const ProfileImage({required this.image, required this.name, super.key});

  @override
  Widget build(final BuildContext context) => Column(
        children: [
          Image.asset(
            image,
            width: 50,
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Utils.smallGap,
              AppText.bodyMedium(
                name,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 12,
                color: AppColor.grey,
              ),
            ],
          )
        ],
      );
}
