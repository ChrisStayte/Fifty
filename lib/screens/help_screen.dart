import 'package:fifty/global.dart';
import 'package:fifty/screens/widgets/gradient_icon.dart';
import 'package:fifty/screens/widgets/gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  PackageInfo _packageInfo = PackageInfo(
      appName: 'Unknown',
      packageName: 'Unknown',
      version: 'Unknown',
      buildNumber: 'Unknown',
      buildSignature: 'Unknown');

  @override
  void initState() {
    _initPackageInfo();
    super.initState();
  }

  Future<void> _initPackageInfo() async {
    await PackageInfo.fromPlatform()
        .then((value) => setState(() => _packageInfo = value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GradientText(
          'Help',
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0XFFDB7343),
              Color(0XFF3D7695),
            ],
          ),
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.close,
              color: Color(0XFF3D7695),
            ),
          )
        ],
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      gradient: Global.colors.gradient,
                      borderRadius: BorderRadius.all(
                        Radius.circular(Global.ui.cornerRadius),
                      ),
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'What is fifty?',
                            style: TextStyle(
                                color: Colors.white.withOpacity(.9),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Your daily fitness goals. You can choose from a set of preset fitness objectives or custom create your own. The only thing you cannot control is the amount. That would go against the core app philosophy.',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 16,
                            ),
                          )
                        ]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      gradient: Global.colors.gradient,
                      borderRadius: BorderRadius.all(
                        Radius.circular(Global.ui.cornerRadius),
                      ),
                    ),
                    child: Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Global.colors.backgroundColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(Global.ui.cornerRadius),
                          ),
                        ),
                        child: Material(
                          borderRadius: BorderRadius.all(
                              Radius.circular(Global.ui.cornerRadius)),
                          color: Colors.transparent,
                          clipBehavior: Clip.hardEdge,
                          child: InkWell(
                            onTap: () async {
                              final Uri uri = Uri(
                                scheme: 'https',
                                path: 'www.twitter.com/ChrisStayte',
                              );

                              if (await canLaunchUrl(uri)) {
                                await launchUrl(uri).catchError(
                                  (error) {
                                    print(error);
                                    return false;
                                  },
                                );
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GradientIcon(FontAwesomeIcons.twitter, 25,
                                        Global.colors.gradient),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    GradientText('Twitter',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                        gradient: Global.colors.gradient)
                                  ]),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      gradient: Global.colors.gradient,
                      borderRadius: BorderRadius.all(
                        Radius.circular(Global.ui.cornerRadius),
                      ),
                    ),
                    child: Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Global.colors.backgroundColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(Global.ui.cornerRadius),
                          ),
                        ),
                        child: Material(
                          borderRadius: BorderRadius.all(
                              Radius.circular(Global.ui.cornerRadius)),
                          color: Colors.transparent,
                          clipBehavior: Clip.hardEdge,
                          child: InkWell(
                            onTap: () async {
                              final Uri uri = Uri(
                                scheme: 'mailto',
                                path: 'fifty@chrisstayte.com',
                                query:
                                    'subject=App Feedback (${_packageInfo.version})',
                              );

                              if (await canLaunchUrl(uri)) {
                                await launchUrl(uri);
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GradientIcon(FontAwesomeIcons.envelope, 25,
                                        Global.colors.gradient),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    GradientText('Email',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                        gradient: Global.colors.gradient)
                                  ]),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      gradient: Global.colors.gradient,
                      borderRadius: BorderRadius.all(
                        Radius.circular(Global.ui.cornerRadius),
                      ),
                    ),
                    child: Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Global.colors.backgroundColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(Global.ui.cornerRadius),
                          ),
                        ),
                        child: Material(
                          borderRadius: BorderRadius.all(
                            Radius.circular(Global.ui.cornerRadius),
                          ),
                          color: Colors.transparent,
                          clipBehavior: Clip.hardEdge,
                          child: InkWell(
                            onTap: () async {
                              final Uri uri = Uri(
                                scheme: 'https',
                                path: 'www.github.com/ChrisStayte/Fifty',
                              );

                              if (await canLaunchUrl(uri)) {
                                await launchUrl(uri).catchError(
                                  (error) {
                                    print(error);
                                    return false;
                                  },
                                );
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GradientIcon(FontAwesomeIcons.github, 25,
                                        Global.colors.gradient),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    GradientText('Source Code',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                        gradient: Global.colors.gradient)
                                  ]),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Column(
                    children: [
                      GradientText(
                        'Version ${_packageInfo.version}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        gradient: Global.colors.gradient,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GradientText(
                        'Built Using Flutter',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        gradient: Global.colors.gradient,
                      ),
                    ],
                  )
                ],
              ),
              // Align(
              //   widthFactor: 1.0,
              //   alignment: Alignment.bottomCenter,
              //   child: GestureDetector(
              //     onTap: () => Navigator.pop(context),
              //     child: Container(
              //       decoration: BoxDecoration(
              //           color: Colors.red.shade400,
              //           gradient: Global.colors.gradient,
              //           borderRadius:
              //               BorderRadius.circular(Global.ui.cornerRadius)),
              //       height: 48,
              //       child: Center(
              //         child: Text(
              //           'Close',
              //           style: TextStyle(
              //             color: Colors.white,
              //             fontSize: 18,
              //             fontWeight: FontWeight.bold,
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
