import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/config/styles.dart';
import 'package:flutter_web_portfolio/widgets/responsive_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../config/colors.dart';
import '../config/constants.dart';
import '../widgets/icon.dart';
import 'about.dart';
import 'contact_us.dart';
import 'footer.dart';
import 'header.dart';
import 'my_projects.dart';
import 'statistics.dart';
import 'working_process.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _headerGlobalKey = GlobalKey();
  final _aboutGlobalKey = GlobalKey();
  final _statisticsGlobalKey = GlobalKey();
  final _workingProcessGlobalKey = GlobalKey();
  final _recentProjectsGlobalKey = GlobalKey();
  final _contactUsGlobalKey = GlobalKey();

  final _scrollController = ScrollController();

  final _fabStream = StreamController<bool>();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      _fabStream.sink.add(_scrollController.offset > 500);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      desktopScreen: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                key: _headerGlobalKey,
                titleSpacing: 0,
                toolbarHeight: 100,
                backgroundColor: Colors.transparent,
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/cover.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black,
                          Colors.black87,
                          Colors.transparent
                        ],
                      ),
                    ),
                  ),
                ),
                // title: Padding(
                //   padding: EdgeInsets.only(
                //     left: MediaQuery.of(context).size.width * .15,
                //   ),
                //   child: ClipRRect(
                //     borderRadius: BorderRadius.circular(1000),
                //     child: Container(
                //       color: AppColors.kGreyLightColor,
                //       child: Image.asset(
                //         AppConstants.avatar,
                //         width: 50,
                //         height: 50,
                //         fit: BoxFit.cover,
                //       ),
                //     ),
                //   ),
                // ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(500),
                  child: Header(),
                ),
                actions: [
                  Row(
                    children: [
                      MaterialButton(
                        onPressed: _scrollToAbout,
                        highlightColor: Colors.white60,
                        child: Text(
                          'About Me',
                          style: AppStyles.kBoldWhiteStyle,
                        ),
                      ),
                      MaterialButton(
                        onPressed: _scrollToStatistics,
                        child: Text(
                          'Experience',
                          style: AppStyles.kBoldWhiteStyle,
                        ),
                      ),
                      MaterialButton(
                        onPressed: _scrollToWorkingProcess,
                        child: Text(
                          'Process',
                          style: AppStyles.kBoldWhiteStyle,
                        ),
                      ),
                      MaterialButton(
                        onPressed: _scrollToRecentProjects,
                        child: Text(
                          'Portfolio',
                          style: AppStyles.kBoldWhiteStyle,
                        ),
                      ),
                      const SizedBox(width: 20),
                      RaisedButton(
                        onPressed: _scrollToContactUs,
                        color: AppColors.kRedColor,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 15,
                        ),
                        child: Text(
                          'Contact Me',
                          style: AppStyles.kBoldWhiteStyle,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * .15),
                ],
              ),
              ..._slivers(),
            ],
          ),
        ),
        floatingActionButton: _buildFab(),
      ),
      mobileScreen: Scaffold(
        drawer: Drawer(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(1000),
                  child: Container(
                    color: AppColors.kGreyLightColor,
                    child: Image.asset(
                      AppConstants.avatar,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  onTap: (){
                    Navigator.pop(context);
                    _scrollToAbout();
                  },
                  title: Text(
                    'About Me',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  onTap: (){
                    Navigator.pop(context);
                    _scrollToStatistics();
                  },
                  title: Text(
                    'Experience',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  onTap: (){
                    Navigator.pop(context);
                    _scrollToWorkingProcess();
                  },
                  title: Text(
                    'Process',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  onTap: (){
                    Navigator.pop(context);
                    _scrollToRecentProjects();
                  },
                  title: Text(
                    'Portfolio',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(),
                const SizedBox(height: 20),
                ListTile(
                  title: RaisedButton(
                    onPressed: (){
                      Navigator.pop(context);
                      _scrollToContactUs();
                    },
                    color: AppColors.kRedColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    child: Text(
                      'Contact Me',
                      style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.kWhiteColor),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async {
                        launch(AppConstants.github);
                      },
                      child: AppIcon(
                        'icons/github.png',
                        color: AppColors.kBlackColor,
                      ),
                    ),
                    const SizedBox(width: 20),
                    InkWell(
                      onTap: () {
                        launch(AppConstants.linkedin);
                      },
                      child: AppIcon(
                        'icons/linkedin.png',
                        color: AppColors.kBlackColor,
                      ),
                    ),
                    const SizedBox(width: 20),
                    InkWell(
                      onTap: () {
                        launch(AppConstants.twitter);
                      },
                      child: AppIcon(
                        'icons/twitter.png',
                        color: AppColors.kBlackColor,
                      ),
                    ),
                    const SizedBox(width: 20),
                    InkWell(
                      onTap: () {
                        launch(AppConstants.facebook);
                      },
                      child: AppIcon(
                        'icons/facebook.png',
                        color: AppColors.kBlackColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                key: _headerGlobalKey,
                titleSpacing: 0,
                centerTitle: true,
                backgroundColor: Colors.transparent,
                leading: Align(
                  child: Builder(
                    builder: (ctx) => GestureDetector(
                      onTap: () {
                        Scaffold.of(ctx).openDrawer();
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(1000),
                        child: Container(
                          width: 40,
                          height: 40,
                          color: AppColors.kRedColor,
                          child:Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("icons/drawer.png",color: AppColors.kWhiteColor,),
                          )
                        ),
                      ),
                    ),
                  ),
                ),
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/cover.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black,
                          Colors.black87,
                          Colors.transparent
                        ],
                      ),
                    ),
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(350),
                  child: Header(),
                ),
              ),
              ..._slivers(),
            ],
          ),
        ),
        floatingActionButton: _buildFab(),
      ),
    );
  }

  List<Widget> _slivers() => [
        SliverToBoxAdapter(
          key: _aboutGlobalKey,
          child: About(),
        ),
        SliverToBoxAdapter(
          key: _statisticsGlobalKey,
          child: Statistics(),
        ),
        SliverToBoxAdapter(
          key: _workingProcessGlobalKey,
          child: WorkingProcess(),
        ),
        SliverToBoxAdapter(
          key: _recentProjectsGlobalKey,
          child: MyProjects(),
        ),
        SliverToBoxAdapter(
          key: _contactUsGlobalKey,
          child: ContactUs(),
        ),
        SliverToBoxAdapter(
          child: Footer(),
        ),
      ];

  Widget _buildFab() {
    return StreamBuilder<bool>(
      stream: _fabStream.stream,
      builder: (_, data) {
        final bool showFab = data.hasData && data.data!;
        return AnimatedOpacity(
          opacity: showFab ? 1 : 0,
          duration: const Duration(milliseconds: 500),
          child: FloatingActionButton(
            onPressed: showFab
                ? _scrollToHeader
                : null, // make sure user cannot click when button hidden
            mini: true,
            child: AppIcon('icons/double-up-arrow.png', size: 15),
          ),
        );
      },
    );
  }

  void _scrollToHeader() {
    Scrollable.ensureVisible(
      _headerGlobalKey.currentContext!,
      duration: const Duration(seconds: 1),
    );
  }

  void _scrollToAbout() {
    Scrollable.ensureVisible(
      _aboutGlobalKey.currentContext!,
      duration: const Duration(seconds: 1),
    );
  }

  void _scrollToStatistics() {
    Scrollable.ensureVisible(
      _statisticsGlobalKey.currentContext!,
      duration: const Duration(seconds: 1),
    );
  }

  void _scrollToWorkingProcess() {
    Scrollable.ensureVisible(
      _workingProcessGlobalKey.currentContext!,
      duration: const Duration(seconds: 1),
    );
  }

  void _scrollToRecentProjects() {
    Scrollable.ensureVisible(
      _recentProjectsGlobalKey.currentContext!,
      duration: const Duration(seconds: 1),
    );
  }

  void _scrollToContactUs() {
    Scrollable.ensureVisible(
      _contactUsGlobalKey.currentContext!,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _fabStream.close();
    super.dispose();
  }
}
