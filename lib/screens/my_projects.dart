import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/models/projects.dart';
import 'package:url_launcher/url_launcher.dart';

import '../config/colors.dart';
import '../config/styles.dart';
import '../widgets/responsive_widget.dart';

class MyProjects extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      desktopScreen: Container(
        color: AppColors.kGreyLightColor,
        padding: EdgeInsets.symmetric(vertical: 100),
        child: Column(
          children: [
            Text('MY PROJECTS', style: AppStyles.title),
            Container(width: 100, height: 2, color: AppColors.kRedColor),
            const SizedBox(height: 3),
            Container(width: 75, height: 2, color: AppColors.kRedColor),
            const SizedBox(height: 50),
            ...PROJECTS.map((p) => _buildProject(context, p)).toList(),
          ],
        ),
      ),
      mobileScreen: Container(
        color: AppColors.kGreyLightColor,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .15,
          vertical: 50,
        ),
        child: Column(
          children: [
            Text(
              'MY PROJECTS',
              style: AppStyles.title,
              textAlign: TextAlign.center,
            ),
            Container(width: 75, height: 2, color: AppColors.kRedColor),
            const SizedBox(height: 3),
            Container(width: 50, height: 2, color: AppColors.kRedColor),
            const SizedBox(height: 50),
            Wrap(
              children: PROJECTS.map((p) => _buildProject(context, p)).toList(),
              spacing: 5,
              runSpacing: 5,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProject(BuildContext context, Project project) =>
      ResponsiveWidget(
        desktopScreen: SizedBox(
          width: MediaQuery.of(context).size.width * .7,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .15,
                    height: MediaQuery.of(context).size.width * .3,
                    child: Image.asset(project.image!,fit: BoxFit.cover,),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * .075),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.width * .01,
                        ),
                        Text(project.name!, style: AppStyles.title),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * .01,
                        ),
                        Text(project.description!),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * .025,
                        ),
                        Wrap(
                          spacing: 10,
                          children: project.skills!
                              .map((s) => Chip(label: Text(s)))
                              .toList(),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * .025,
                        ),
                        RaisedButton(
                          onPressed: () {
                            launch(project.url!);
                          },
                          color: AppColors.kRedColor,
                          textColor: AppColors.kWhiteColor,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 35, vertical: 20),
                          child: Text('VISIT'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Divider(
                color: AppColors.kBlackColor.withOpacity(.1),
                height: 20,
                thickness: 1,
              ),
            ],
          ),
        ),
        mobileScreen: SizedBox(
          width: MediaQuery.of(context).size.width * .7,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width * .75,
                child: Image.asset(project.image!),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * .075),
              SizedBox(
                height: MediaQuery.of(context).size.width * .025,
              ),
              Text(project.name!, style: AppStyles.title),
              SizedBox(
                height: MediaQuery.of(context).size.width * .01,
              ),
              Text(
                project.description!,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * .025,
              ),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.spaceBetween,
                children:
                    project.skills!.map((s) => Chip(label: Text(s))).toList(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * .025,
              ),
              RaisedButton(
                onPressed: () {
                  launch(project.url!);
                },
                color: AppColors.kRedColor,
                textColor: AppColors.kWhiteColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                child: Text('VISIT'),
              ),
              Divider(
                color: AppColors.kBlackColor.withOpacity(.1),
                height: 50,
                thickness: 1,
              ),
            ],
          ),
        ),
      );
}
