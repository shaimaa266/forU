
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled1/core/helpers/exitentions.dart';
import 'package:untitled1/core/helpers/launch_url.dart';

import '../../../../../core/routing/routes.dart';
import 'custom_raw_service_container.dart';

class ProfileSecondContainerSec extends StatelessWidget {
  const ProfileSecondContainerSec({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Column(
        children: [
          CustomRowServiceContainer(
            onPressed: () {
              context.pushNamed(Routes.changePassView);
            },
            name: "Change Password",
            iconName: Icons.password_sharp,
          ),
          CustomRowServiceContainer(
            onPressed: () {
              context.pushNamed(Routes.favoritesView);
            },
            name: "Favorites",
            iconName: Icons.bookmark_outline,
          ),
          CustomRowServiceContainer(
            onPressed: () {
              context.pushNamed(Routes.themeView);
            },
            name: "Theme",
            iconName: Icons.color_lens_outlined,
          ),
          CustomRowServiceContainer(
            onPressed: () {
              context.pushNamed(Routes.languageView);
            },
            name: "Language",
            iconName: Icons.language_outlined,
          ),
          CustomRowServiceContainer(
            onPressed: () {
              customLaunchUrl(context, 'https://www.linkedin.com/in/ebrahim-elkbbany-4b2374213/');
            },
            name: "Contact us",
            iconName: Icons.email,
          ),
          CustomRowServiceContainer(
            isLast: true,
            onPressed: () {},
            name: "Notifications",
            iconName: Icons.notifications,
          ),
        ],
      ),
    );
  }
}