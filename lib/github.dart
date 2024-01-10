import 'package:flutter/material.dart';
import 'package:portofolio/view.dart';
import 'package:url_launcher/url_launcher.dart';

class GithubProfileButton extends StatelessWidget {
  const GithubProfileButton({super.key});

  final String _githubUrl = 'https://github.com/MizuPanda';

  Future<void> _openLink() async {
    Uri uri = Uri.parse(_githubUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $_githubUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ViewButton(
      onTap: _openLink, 
      title: 'GitHub Profile',);
  }
}