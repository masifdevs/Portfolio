import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/config/styles.dart';
import 'package:flutter_web_portfolio/widgets/responsive_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../config/colors.dart';
import '../config/constants.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ResponsiveWidget(
        desktopScreen: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('I’m ${AppConstants.name}',
                  style: AppStyles.kCustomStyle(
                      AppColors.kWhiteColor, 40, FontWeight.w900)),
              Text(AppConstants.job,
                  style: AppStyles.kCustomStyle(
                      AppColors.kRedColor, 40, FontWeight.w900)),
              const SizedBox(height: 5),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: Text(
                  AppConstants.description,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: AppColors.kGreyLightColor,
                        fontSize: 17,
                      ),
                ),
              ),
              const SizedBox(height: 30),
              RaisedButton(
                color: AppColors.kRedColor,
                textColor: AppColors.kWhiteColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                onPressed: _downloadCV,
                child: Text('Download CV'),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
        mobileScreen: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .15,
          ),
          child: FittedBox(
            child: Column(
              children: [
                Text('I’m ${AppConstants.name}',
                    style: AppStyles.kCustomStyle(
                        AppColors.kWhiteColor, 30, FontWeight.w900)),
                Text(AppConstants.job,
                    style: AppStyles.kCustomStyle(
                        AppColors.kRedColor, 30, FontWeight.w900)),
                const SizedBox(height: 5),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    AppConstants.description,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: AppColors.kGreyLightColor,
                          fontSize: 15,
                          height: 1.8,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 30),
                RaisedButton(
                  color: AppColors.kRedColor,
                  textColor: AppColors.kWhiteColor,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  onPressed: _downloadCV,
                  child: Text('Download CV'),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      );

  void _downloadCV() {
    launch(AppConstants.cv);
  }
}
