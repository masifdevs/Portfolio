import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/models/skills.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

import '../config/colors.dart';
import '../config/constants.dart';
import '../config/styles.dart';
import '../widgets/responsive_widget.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ResponsiveWidget(
        desktopScreen: Container(
          color: AppColors.kWhiteColor,
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .15,
            vertical: 100,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(1000),
                    child: Container(
                      color: AppColors.kGreyLightColor,
                      child: Image.asset(
                        AppConstants.avatar,
                        width: 300,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ABOUT ME',
                          style: TextStyle(
                            color: AppColors.kRedColor,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          AppConstants.descriptionDetail,
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    color: Colors.black.withOpacity(.7),
                                    fontSize: 17,
                                  ),
                        ),
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            RaisedButton(
                              onPressed: _openWhatsaApp,
                              color: AppColors.kRedColor,
                              textColor: AppColors.kWhiteColor,
                              child: Container(
                                height: 40,
                                width: 140,
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                    children: [
                                      Image.asset(
                                        "icons/whatsapp.png",
                                        width: 20,
                                        height: 20,
                                        color: AppColors.kWhiteColor,
                                        fit: BoxFit.cover,
                                      ),
                                      Text('HIRE ME NOW'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            RaisedButton(
                              onPressed: _downloadCV,
                              color: AppColors.kBlackColor,
                              textColor: AppColors.kWhiteColor,
                              child: Container(
                                  height: 40,
                                  width: 140,
                                  child: Center(child: Text('VIEW RESUME'))),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 100),
              Text('MY SKILLS', style: AppStyles.title),
              Container(width: 100, height: 2, color: AppColors.kRedColor),
              const SizedBox(height: 3),
              Container(width: 75, height: 2, color: AppColors.kRedColor),
              const SizedBox(height: 50),
              Wrap(
                spacing: 25,
                runSpacing: 25,
                runAlignment: WrapAlignment.spaceBetween,
                children: SKILLS.map(_buildSkill).toList(),
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
              ClipRRect(
                borderRadius: BorderRadius.circular(1000),
                child: Container(
                  color: AppColors.kGreyLightColor,
                  child: Image.asset(
                    AppConstants.avatar,
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'ABOUT ME',
                style: TextStyle(
                  color: AppColors.kRedColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                AppConstants.descriptionDetail,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: Colors.black.withOpacity(.7),
                      fontSize: 13,
                    ),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 30),
              RaisedButton(
                  onPressed: _openWhatsaApp,
                  color: AppColors.kRedColor,
                  textColor: AppColors.kWhiteColor,
                  child: Container(
                      height: 40,
                      width: 120,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            "icons/whatsapp.png",
                            width: 20,
                            height: 20,
                            color: AppColors.kWhiteColor,
                            fit: BoxFit.cover,
                          ),
                          Text('HIRE ME NOW'),
                        ],
                      ))),
              const SizedBox(height: 20),
              RaisedButton(
                onPressed: _downloadCV,
                color: AppColors.kBlackColor,
                textColor: AppColors.kWhiteColor,

                child: SizedBox(
                    height: 40,
                    width: 120,
                    child: Center(child: Text('VIEW RESUME'))),
              ),
              const SizedBox(height: 50),
              Text('MY SKILLS', style: AppStyles.title),
              Container(width: 75, height: 2, color: AppColors.kRedColor),
              const SizedBox(height: 3),
              Container(width: 50, height: 2, color: AppColors.kRedColor),
              const SizedBox(height: 25),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.spaceBetween,
                children: SKILLS.map(_buildSkill).toList(),
              ),
            ],
          ),
        ),
      );

  void _downloadCV() {
    launch(AppConstants.cv);
  }

  void _openWhatsaApp() async {
    final link = WhatsAppUnilink(
      phoneNumber: AppConstants.whatsApp,
      text: "Hey! I'm inquiring about the apartment listing",
    );
    // Convert the WhatsAppUnilink instance to a string.
    // Use either Dart's string interpolation or the toString() method.
    // The "launch" method is part of "url_launcher".
    await launch('$link');
  }

  Widget _buildSkill(Skill skill) => Chip(label: Text(skill.name!));
}
