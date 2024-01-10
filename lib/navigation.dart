import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    return SizedBox(
      width: 200, // Set your desired width for the navigation menu
      child: Consumer<AppProvider>(
          builder: (BuildContext context, AppProvider provider, Widget? child) {
        return ListView(
          children: [
            NavItem(
                iconData: Icons.square,
                title: 'about',
                isSelected: _selectedIdx == 0,
                onTap: () {
                  provider.scrollToItem(0);
                  setState(() {
                    _selectedIdx = 0;
                  });
                }),
            NavItem(
                iconData: Icons.propane,
                title: 'projects',
                isSelected: _selectedIdx == 1,
                onTap: () {
                  provider.scrollToItem(1);
                  setState(() {
                    _selectedIdx = 1;
                  });
                }),
            NavItem(
                iconData: Icons.circle,
                title: 'experience',
                isSelected: _selectedIdx == 2,
                onTap: () {
                  provider.scrollToItem(2);
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
                  ? 20.0
                  : _isHovered
                      ? 10.0
                      : 0.0,
              top: 5.0,
              bottom: 5.0),
          child: Row(
            children: [
              Icon(
                widget.iconData,
                size: 8,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(widget.title,
                  style: GoogleFonts.openSans(
                      fontWeight: widget.isSelected || _isHovered
                          ? FontWeight.bold
                          : FontWeight.normal,
                      fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
