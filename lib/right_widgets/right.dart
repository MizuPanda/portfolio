import 'package:flutter/material.dart';
import 'package:portofolio/constants.dart';
import 'package:portofolio/right_widgets/about_text.dart';
import 'package:portofolio/right_widgets/experience_widget.dart';
import 'package:portofolio/right_widgets/github_profile_button.dart';
import 'package:portofolio/right_widgets/project_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portofolio/provider.dart';
import 'package:portofolio/right_widgets/resume_button.dart';
import 'package:provider/provider.dart';

class RightColumn extends StatelessWidget {
  const RightColumn({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    final SizedBox projectSeparator = SizedBox(height: 15/Constants.height*height,);

    return Expanded(
      child: SizedBox(
        height: double.infinity,
        child: Consumer<AppProvider>(
          builder: (BuildContext context, AppProvider provider, Widget? child) {
            return SingleChildScrollView(
              controller: provider.scrollController,
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.only(left: 60.0/Constants.width*width, top: 100/Constants.height*height, right: 60.0/Constants.width*width),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Right Column Content
                    //ABOUT
                    const AboutText(),
                    SizedBox(height: 40/Constants.height*height,),
                    // Project Cards
                    //PROJECTS
                    const ProjectCard(
                      title: 'Befriend - Your Social Circle',
                      description:
                          'A dynamic social app designed to forge new friendships through a platform that leverages real life interactions for connection.',
                      technologies: [
                        'Dart',
                        'Flutter',
                        'Swift',
                        'Java',
                        'XML',
                        'Javascript',
                        'Firebase',
                        'Firestore',
                        'Cloud Functions',
                        'Firebase Storage',
                      ],
                      url: Constants.befriendUrl,
                      image: AssetImage(Constants.befriendAsset),
                    ),
                    projectSeparator,
                     const ProjectCard(
                      title: 'Minecraftia - Minecraft RPG Mod',
                      description:
                          'A Minecraft mod that introduces new and enhanced player statistics, inspired by classic role-playing game mechanics.',
                      technologies: [
                        'Java',
                        'Neoforge',
                        'JSON',
                      ],
                      url: Constants.minecraftiaUrl,
                      image: AssetImage(Constants.minecraftiaAsset),
                    ),
                    projectSeparator,
                    // Add more projects here


                    const Padding(
                      padding: EdgeInsets.all(18.0),
                      child: GithubProfileButton(),
                    ),
            
                    //EXPERIENCE
                    // Add experience here
                    Text('Experiences', style: GoogleFonts.openSans(fontWeight:FontWeight.bold, fontSize: 32),),
                    SizedBox(height: 10/Constants.height*height,),

                    ExperienceTimeline(
                      experiences: [
                        Constants.chemistryInternship
                      ],),

                    const Padding(
                      padding: EdgeInsets.all(18.0),
                      child: FullResumeButton(),
                    ),
                  
                    SizedBox(height: 200/Constants.height*height),
                   Text('Website built using Flutter by Juniel Djossou. Inspired by Evan Yan\'s portfolio.',
                    style: GoogleFonts.openSans(),),
                    SizedBox(height: 150/Constants.height*height,)
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