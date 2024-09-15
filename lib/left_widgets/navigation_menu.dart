import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portofolio/constants.dart';
import 'package:portofolio/provider.dart';
import 'package:provider/provider.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({
    super.key,
  });

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int _selectedIdx = 0;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    
    return SizedBox(
      width: 200/Constants.width*width, // Set your desired width for the navigation menu
      child: Consumer<AppProvider>(
          builder: (BuildContext context, AppProvider provider, Widget? child) {

        return ListView(
          children: [
            NavItem(
                iconData: Icons.square,
                title: 'about',
                isSelected: _selectedIdx == 0,
                onTap: () {
                  provider.scrollToItem(0, height);
                  setState(() {
                    _selectedIdx = 0;
                  });
                }),
            NavItem(
                iconData: Icons.propane,
                title: 'projects',
                isSelected: _selectedIdx == 1,
                onTap: () {
                  provider.scrollToItem(1, height);
                  setState(() {
                    _selectedIdx = 1;
                  });
                }),
            NavItem(
                iconData: Icons.circle,
                title: 'experience',
                isSelected: _selectedIdx == 2,
                onTap: () {
                  provider.scrollToItem(2, height);
                  setState(() {
                    _selectedIdx = 2;
                  });
                }),
          ],
        );
      }),
    );
  }
}

class NavItem extends StatefulWidget {
  final String title;
  final IconData iconData;
  final bool isSelected;
  final VoidCallback onTap;

  const NavItem(
      {super.key,
      required this.title,
      required this.isSelected,
      required this.onTap,
      required this.iconData});

  @override
  State<NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      } /* Implement hover in logic */,
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      } /* Implement hover out logic */,
      child: InkWell(
        onTap: widget.onTap,
        overlayColor: const MaterialStatePropertyAll(Colors.transparent),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: EdgeInsets.only(
              left: widget.isSelected
                  ? 20.0/Constants.width*width
                  : _isHovered
                      ? 10.0/Constants.width*width
                      : 0.0,
              top: 5.0/Constants.height*height,
              bottom: 5.0/Constants.height*height),
          child: Row(
  children: [
    Icon(
      widget.iconData,
      size: 8,
    ),
    SizedBox(
      width: 5 / Constants.width * width,
    ),
    Flexible(
      child: Text(
        widget.title,
        style: GoogleFonts.openSans(
          fontWeight: widget.isSelected || _isHovered
              ? FontWeight.bold
              : FontWeight.normal,
          fontSize: 16,
        ),
        overflow: TextOverflow.ellipsis, // Ensure text doesn't overflow
      ),
    ),
  ],
),

        ),
      ),
    );
  }
}
