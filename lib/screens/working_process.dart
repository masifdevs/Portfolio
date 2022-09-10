import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/widgets/responsive_widget.dart';

import '../config/colors.dart';
import '../config/styles.dart';
import '../widgets/icon.dart';

class WorkingProcess extends StatelessWidget {
  String planDesc =
      "It helps to define the problem and scope of any existing systems, as well as determine the objectives for your new systems.";
  String designDesc =
      "In design stage is a necessary precursor which define the details for the overall application i.e. user interfaces and network requirements";
  String codingDesc =
      "The code stage includes build the entire system by using Flutter & Dart, static code analysis and code review for multiple types of devices.";
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      desktopScreen: Container(
        color: AppColors.kWhiteColor,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .15,
          vertical: 100,
        ),
        child: Column(
          children: [
            Text('WORKING PROCESS', style: AppStyles.title),
            Container(width: 100, height: 2, color: AppColors.kRedColor),
            const SizedBox(height: 3),
            Container(width: 75, height: 2, color: AppColors.kRedColor),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: __buildProcess(
                        context, '01.', 'icons/pencil.png', 'Plan', planDesc)),
                const SizedBox(width: 10),
                Expanded(
                    child: __buildProcess(context, '02.', 'icons/design.png',
                        'Design', designDesc)),
                const SizedBox(width: 10),
                Expanded(
                    child: __buildProcess(context, '03.', 'icons/coding.png',
                        'Code', codingDesc)),
              ],
            ),
          ],
        ),
      ),
      mobileScreen: Container(
        color: AppColors.kWhiteColor,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .15,
          vertical: 50,
        ),
        child: Column(
          children: [
            Text(
              'WORKING PROCESS',
              style: AppStyles.title,
              textAlign: TextAlign.center,
            ),
            Container(width: 75, height: 2, color: AppColors.kRedColor),
            const SizedBox(height: 3),
            Container(width: 50, height: 2, color: AppColors.kRedColor),
            const SizedBox(height: 50),
            __buildProcess(
                context, '01.', 'icons/pencil.png', 'Plan', planDesc),
            const SizedBox(height: 10),
            __buildProcess(
                context, '02.', 'icons/design.png', 'Design', designDesc),
            const SizedBox(height: 10),
            __buildProcess(
                context, '03.', 'icons/coding.png', 'Code', codingDesc)
          ],
        ),
      ),
    );
  }

  Widget __buildProcess(BuildContext context, String index, String iconPath,
      String title, String description) {
    return Card(
      elevation: 3,
      child: SizedBox(
        height:MediaQuery.of(context). size.width>940&&MediaQuery.of(context). size.width<1050?320: 300,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  index,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Divider(color: AppColors.kGreyLightColor),
              const SizedBox(height: 10),
              AppIcon(iconPath, color: AppColors.kBlackColor, size: 40),
              const SizedBox(height: 20),
              Text(
                title,
                style: TextStyle(
                  color: AppColors.kBlackColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                description,
                style: TextStyle(
                  color: Colors.black45,
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
