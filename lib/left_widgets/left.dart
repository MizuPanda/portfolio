import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portofolio/constants.dart';
import 'package:portofolio/left_widgets/navigation_menu.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';



class LeftColumn extends StatefulWidget {
  const LeftColumn({super.key});

  @override
  State<LeftColumn> createState() => _LeftColumnState();
}

class _LeftColumnState extends State<LeftColumn> {

  String buttonText = 'Email';

  void _copyEmailToClipboard() async {
    await Clipboard.setData(
        const ClipboardData(text: 'junieldjossou@gmail.com'));
    setState(() {
      buttonText = 'Copied!';
    });

    // Optionally, reset the button text after a few seconds
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        buttonText = 'Email';
      });
    });
  }

  Future<void> _openLink(String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
   final ButtonStyle buttonStyle = ButtonStyle(
      overlayColor: MaterialStatePropertyAll(Theme.of(context).textTheme.displayMedium?.color),
      foregroundColor: MaterialStatePropertyAll(Theme.of(context).textTheme.bodyMedium?.color),
      backgroundColor:
          const MaterialStatePropertyAll(Color.fromARGB(105, 211, 216, 245)));

    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 70/Constants.width*width),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Personal Information
                   SizedBox(
                    height: 70/Constants.height*height,
                  ),
                  Text(
                    'Juniel Djossou',
                    style: GoogleFonts.openSans(
                      fontSize: 55,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Honours Computer Science Degree \n@ University of Waterloo',
                    style:
                        GoogleFonts.openSans(fontSize: 18, color: Colors.grey),
                  ),
                   SizedBox(
                    height: 10/Constants.height*height,
                  ),
                  // Contact Links
                  Wrap(
  spacing: 8.0, // Space between items
  runSpacing: 4.0, // Space between rows if wrapped
  children: [
    GestureDetector(
      onTap: _copyEmailToClipboard,
      child: TextButton(
        style: buttonStyle,
        onPressed: _copyEmailToClipboard,
        child: Text(
          buttonText,
          style: GoogleFonts.openSans(),
        ),
      ),
    ),
    TextButton(
      style: buttonStyle,
      onPressed: () async {
        await _openLink(Constants.githubUrl);
      },
      child: Text(
        'Github',
        style: GoogleFonts.openSans(),
      ),
    ),
    TextButton(
      style: buttonStyle,
      onPressed: () async {
        await _openLink(Constants.linkedInUrl);
      },
      child: Text(
        'LinkedIn',
        style: GoogleFonts.openSans(),
      ),
    ),
  ],
),

                  SizedBox(
                    height: 40/Constants.height*height,
                  ),

                  // Navigation Links
                  const Expanded(child: NavigationMenu())
                ],
              ),
            ),
          );
  }
}
