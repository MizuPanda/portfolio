import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portofolio/constants.dart';

class ExperienceTimeline extends StatelessWidget {
  final List<ExperienceEntry> experiences;

  const ExperienceTimeline({Key? key, required this.experiences}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: experiences.map((experience) => ExperienceCard(experience: experience)).toList(),
      ),
    );
  }
}

class ExperienceEntry {
  final String company;
  final String role;
  final String duration;
  final String description;

  ExperienceEntry(this.company, this.role, this.duration, this.description);
}

class ExperienceCard extends StatefulWidget {
  final ExperienceEntry experience;

  const ExperienceCard({Key? key, required this.experience}) : super(key: key);

  @override
  State<ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.experience.company, style: GoogleFonts.openSans(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 4/Constants.height*height),
            Text(widget.experience.role, style: GoogleFonts.openSans(fontSize: 16)),
            SizedBox(height: 4/Constants.height*height),
            Text(widget.experience.duration, style: GoogleFonts.openSans(color: Colors.grey[700])),
              Column(
                children: [
                  SizedBox(height: 10/Constants.height*height),
                  Text(
                    widget.experience.description,
                    style: GoogleFonts.openSans(),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
