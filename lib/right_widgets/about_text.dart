
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutText extends StatelessWidget {
  const AboutText({
    super.key,
  });

  static const Color textColor =  Color.fromARGB(255, 121, 121, 121);

  @override
  Widget build(BuildContext context) {
    // Accessing the theme
    final ThemeData theme = Theme.of(context);

   const Color.fromARGB(255, 121, 121, 121); 
   final TextStyle boldStyle = TextStyle(color: theme.textTheme.bodyLarge?.color);


    return RichText(
      text: TextSpan(
        style: GoogleFonts.openSans(fontSize: 22, letterSpacing: 2, fontWeight: FontWeight.bold),
        children: [
          const TextSpan(
            text: 'I’m a full-stack developer skilled in ',
            style: TextStyle(color: textColor)),
          TextSpan(
              text: 'Java',
              style: boldStyle),
          const TextSpan(
            text: ', with a versatile background in ',
            style: TextStyle(color: textColor)),
          TextSpan(
              text: 'mobile development',
              style: boldStyle),
          const TextSpan(
            text: ' and proficiency in ',
            style: TextStyle(color: textColor)
          ),
          TextSpan(
              text: 'multiple programming languages',
              style: boldStyle),
        ],
      ),
    );
  }
}
