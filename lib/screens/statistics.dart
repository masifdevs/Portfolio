import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/config/colors.dart';
import 'package:flutter_web_portfolio/config/constants.dart';
import 'package:flutter_web_portfolio/config/styles.dart';

import '../widgets/icon.dart';
import '../widgets/responsive_widget.dart';

class Statistics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      desktopScreen: Container(
        height: 400,
        color: Colors.black.withOpacity(.7),
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .15,
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          _buildStatistic(context, 'icons/briefcase.png',
              AppConstants.experience, 'Years of Experience'),
          _buildStatistic(context, 'icons/menu.png', AppConstants.projectsDone,
              'Projects Done'),
          _buildStatistic(context, 'icons/happy.png', AppConstants.happyClients,
              'Happy Clients'),
          _buildStatistic(context, 'icons/coffee.png', '∞', 'Coffee Cups'),
        ]),
      ),
      mobileScreen: Container(
        color: Colors.black54,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .15,
          vertical: 50,
        ),
        child: Column(
          children: [
            _buildStatistic(context, 'icons/briefcase.png',
                AppConstants.experience, 'Years of Experience'),
            const SizedBox(height: 50),
            _buildStatistic(context, 'icons/menu.png',
                AppConstants.projectsDone, 'Projects Done'),
            const SizedBox(height: 50),
            _buildStatistic(context, 'icons/happy.png',
                AppConstants.happyClients, 'Happy Clients'),
            const SizedBox(height: 50),
            _buildStatistic(context, 'icons/coffee.png', '∞', 'Coffee Cups'),
          ],
        ),
      ),
    );
  }

  Widget _buildStatistic(
      BuildContext context, String icon, String total, String description) {
    return ResponsiveWidget(
      desktopScreen: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppIcon(icon, size: 50),
          const SizedBox(height: 5),
          Text(total,
              style: AppStyles.kCustomStyle(
                  AppColors.kWhiteColor, 50, FontWeight.w800)),
          const SizedBox(height: 5),
          Text(description,
              style: AppStyles.kCustomStyle(
                  AppColors.kWhiteColor, 20, FontWeight.w700)),
        ],
      ),
      mobileScreen: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppIcon(icon, size: 40),
          const SizedBox(height: 5),
          Text(total,
              style: AppStyles.kCustomStyle(
                  AppColors.kWhiteColor, 30, FontWeight.w700)),
          const SizedBox(height: 5),
          Text(description,
              style: AppStyles.kCustomStyle(
                  AppColors.kWhiteColor, 15, FontWeight.w700)),
        ],
      ),
    );
  }
}
