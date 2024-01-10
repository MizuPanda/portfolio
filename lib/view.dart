import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewButton extends StatefulWidget {
  const ViewButton({super.key, required this.onTap, required this.title});

  final Function() onTap;
  final String title;
  @override
  State<ViewButton> createState() => _ViewButtonState();
}

class _ViewButtonState extends State<ViewButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
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
                Text(
                  'View ${widget.title}',
                  style: GoogleFonts.openSans(
                    decoration: TextDecoration.none,
                    fontSize: 16,
                    letterSpacing: 3,
                    fontWeight: FontWeight.w600
                  ),
                ),
                SizedBox(width: _isHovering? 10 : 5,),
                const Icon(Icons.arrow_forward, size: 15,)
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

