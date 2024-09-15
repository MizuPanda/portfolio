import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portofolio/constants.dart';

class UnderlinedButton extends StatefulWidget {
  const UnderlinedButton({super.key, required this.onTap, required this.title});

  final Function() onTap;
  final String title;

  @override
  State<UnderlinedButton> createState() => _UnderlinedButtonState();
}

class _UnderlinedButtonState extends State<UnderlinedButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Stack(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(  // Make the text flexible
                  child: Text(
                    'View ${widget.title}',
                    style: GoogleFonts.openSans(
                      decoration: TextDecoration.none,
                      fontSize: 16,
                      letterSpacing: 3,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,  // Prevent overflow
                  ),
                ),
                SizedBox(width: _isHovering ? 10 / Constants.width * width : 5 / Constants.width * width),
                const Icon(Icons.arrow_forward, size: 15),
              ],
            ),
            Positioned(
              bottom: 0,
              child: AnimatedContainer(
                height: 2,
                color: Colors.red,
                duration: const Duration(milliseconds: 700),
                width: _isHovering ? MediaQuery.of(context).size.width : 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


