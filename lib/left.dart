import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portofolio/navigation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';



class LeftColumn extends StatefulWidget {
  const LeftColumn({super.key});

  @override
  State<LeftColumn> createState() => _LeftColumnState();
}

class _LeftColumnState extends State<LeftColumn> {
   static const ButtonStyle buttonStyle = ButtonStyle(
      overlayColor: MaterialStatePropertyAll(Color.fromARGB(72, 255, 255, 255)),
      foregroundColor: MaterialStatePropertyAll(Colors.black),
      backgroundColor:
          MaterialStatePropertyAll(Color.fromARGB(105, 211, 216, 245)));

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

  final String _githubUrl = 'https://github.com/MizuPanda';

  final String _linkedInUrl = 'https://www.linkedin.com/in/juniel-djossou/';

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
    return Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 70),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Personal Information
                  const SizedBox(
                    height: 70,
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
                  const SizedBox(
                    height: 10,
                  ),
                  // Contact Links
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: GestureDetector(
                            onTap: _copyEmailToClipboard,
                            child: TextButton(
                                style: buttonStyle,
                                onPressed: _copyEmailToClipboard,
                                child: Text(
                                  buttonText,
                                  style: GoogleFonts.openSans(),
                                ))),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                            style: buttonStyle,
                            onPressed: () async {
                              await _openLink(_githubUrl);
                            },
                            child: Text(
                              'Github',
                              style: GoogleFonts.openSans(),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                            style: buttonStyle,
                            onPressed: () async {
                              await _openLink(_linkedInUrl);
                            },
                            child: Text(
                              'LinkedIn',
                              style: GoogleFonts.openSans(),
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),

                  // Navigation Links
                  const Expanded(child: NavigationMenu())
                ],
              ),
            ),
          );
  }
}
