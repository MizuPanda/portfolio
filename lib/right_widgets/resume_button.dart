import 'package:flutter/material.dart';

import 'package:portofolio/right_widgets/underlined_button.dart';
import "package:universal_html/html.dart" as html;


class FullResumeButton extends StatelessWidget {
  const FullResumeButton({super.key});

  void openResume() {
    const String assetPath = 'assets/full_resume.pdf';
    html.window.open(assetPath, '_blank');
  }

  @override
  Widget build(BuildContext context) {
    return UnderlinedButton(
      onTap: openResume, 
      title: 'Full Resume',);
  }
}
