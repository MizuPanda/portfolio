import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final List<String> technologies;
  final String url;

  const ProjectCard({
    Key? key,
    required this.title,
    required this.description,
    required this.technologies,
    required this.url,
  }) : super(key: key);

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovering = false;

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
    return GestureDetector(
      onTap: () async {
        await _openLink(widget.url);
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (event) => setState(() => _isHovering = true),
        onExit: (event) => setState(() => _isHovering = false),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: _isHovering ? Colors.grey[200] : Colors.transparent,
            border: _isHovering ? Border.all(color: Colors.grey) : null,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: Container(
                    decoration: const BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          blurRadius: 2,
                          offset: Offset(0.3, 0.3))
                    ]),
                    child: const Image(
                      image: AssetImage('assets/befriend2.png'),
                      fit: BoxFit.cover,
                    )),
              ),
              Expanded(
                flex: 7,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(widget.title,
                                style: GoogleFonts.openSans(
                                    fontSize: 24, fontWeight: FontWeight.bold)),
                          ),
                          Builder(builder: (BuildContext context) {
                            if (_isHovering) {
                              return Transform.translate(
                                offset: const Offset(
                                    5, -5), // Adjust the offset as needed
                                child: const Icon(Icons.arrow_outward),
                              );
                            }
                            return const Icon(Icons.arrow_outward);
                          }),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.description,
                        style: GoogleFonts.openSans(),
                      ),
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: widget.technologies
                            .map((tech) => Chip(
                                  label:
                                      Text(tech, style: GoogleFonts.openSans()),
                                  backgroundColor: Colors.grey[200],
                                ))
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
