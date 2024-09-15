import 'package:flutter/material.dart';
import 'package:portofolio/right_widgets/experience_widget.dart';

class Constants {
  static const double width = 1432;
  static const double height = 836;

  // URLS
  static const String befriendUrl = 'https://befriendesc.com';

  static const String githubUrl = 'https://github.com/MizuPanda';

  static const String linkedInUrl = 'https://www.linkedin.com/in/juniel-djossou/';

  static const String minecraftiaUrl = 'https://github.com/MizuPanda/Minecraftia';

  // ASSETS
  static const String befriendAsset = 'assets/befriend2.png';

  static const String minecraftiaAsset = 'assets/minecraft_image.jpg';

  // THEMES
  static final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

static final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.blue,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);


  // EXPERIENCES
  static final ExperienceEntry chemistryInternship = ExperienceEntry(
    'McGill University', 
    'Chemistry Internship', 
    "June - September 2023", 
    "Conducted research on dissolving waste cotton fabrics in various solvents to recycle them into biodegradable cellulose films.");
}