import 'package:flutter/material.dart';
import 'package:portofolio/github.dart';
import 'package:portofolio/project.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portofolio/provider.dart';
import 'package:provider/provider.dart';

class RightColumn extends StatefulWidget {
  const RightColumn({super.key});

  static const Color textColor = Color.fromARGB(255, 126, 126, 126);//Color.fromARGB(255, 49, 46, 46); 
  static const TextStyle boldStyle = TextStyle(color: Colors.black,);

  static const String _befriendUrl = 'https://befriendesc.com';

  @override
  State<RightColumn> createState() => _RightColumnState();
}

class _RightColumnState extends State<RightColumn> {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: double.infinity,
        child: Consumer<AppProvider>(
          builder: (BuildContext context, AppProvider provider, Widget? child) {
            return SingleChildScrollView(
              controller: provider.scrollController,
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(left: 60.0, top: 100, right: 60.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Right Column Content
                    //ABOUT
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.openSans(fontSize: 22, letterSpacing: 2, fontWeight: FontWeight.bold),
                        children: const [
                          TextSpan(
                            text: 'I’m a full-stack developer skilled in ',
                            style: TextStyle(color: RightColumn.textColor)),
                          TextSpan(
                              text: 'Java',
                              style: RightColumn.boldStyle),
                          TextSpan(
                            text: ', with a versatile background in ',
                            style: TextStyle(color: RightColumn.textColor)),
                          TextSpan(
                              text: 'mobile development',
                              style: RightColumn.boldStyle),
                          TextSpan(
                            text: ' and proficiency in ',
                            style: TextStyle(color: RightColumn.textColor)
                          ),
                          TextSpan(
                              text: 'multiple programming languages',
                              style: RightColumn.boldStyle),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40,),
                    // Project Cards
                    //PROJECTS
                    const ProjectCard(
                      title: 'Befriend - Expand Your Social Circle',
                      description:
                          'A dynamic social app designed to forge new friendships through a platform that leverages real life interactions for connection.',
                      technologies: [
                        'Dart',
                        'Flutter',
                        'Swift',
                        'Java',
                        'XML',
                        'Javascript',
                        'Firestore',
                        'Cloud Functions',
                        'Firebase Storage',
                      ],
                      url: RightColumn._befriendUrl,
                    ),
                    const SizedBox(height: 15,),
                    // Add more projects here
                    const Padding(
                      padding: EdgeInsets.all(18.0),
                      child: GithubProfileButton(),
                    ),
            
                    //EXPERIENCE
                    // Add experience here
            
                  
                    const SizedBox(height: 200),
                   Text('Website built with Flutter by Juniel Djossou. Inspired by Evan Yan\'s portfolio.',
                    style: GoogleFonts.openSans(),),
                    const SizedBox(height: 150,)
                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}
