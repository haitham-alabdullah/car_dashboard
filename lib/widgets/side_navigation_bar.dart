import 'package:flutter/material.dart';

import '../classes/theme.dart';

class SideNavigationBar extends StatefulWidget {
  const SideNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.onTap,
  }) : super(key: key);
  final int selectedIndex;
  final void Function(int) onTap;

  @override
  State<SideNavigationBar> createState() => _SideNavigationBarState();
}

class _SideNavigationBarState extends State<SideNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 76,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SideNavigationBarItem(
            icon: Icons.home_rounded,
            isActive: widget.selectedIndex == 0,
            onTap: () => widget.onTap(0),
          ),
          SideNavigationBarItem(
            icon: Icons.location_pin,
            isActive: widget.selectedIndex == 1,
            onTap: () => widget.onTap(1),
          ),
          SideNavigationBarItem(
            icon: Icons.volume_up_rounded,
            isActive: widget.selectedIndex == 2,
            onTap: () => widget.onTap(2),
          ),
          SideNavigationBarItem(
            icon: Icons.phone_rounded,
            isActive: widget.selectedIndex == 3,
            onTap: () => widget.onTap(3),
          ),
          SideNavigationBarItem(
            icon: Icons.settings_rounded,
            isActive: widget.selectedIndex == 4,
            onTap: () => widget.onTap(4),
          ),
        ],
      ),
    );
  }
}

class SideNavigationBarItem extends StatelessWidget {
  const SideNavigationBarItem({
    required this.icon,
    required this.isActive,
    required this.onTap,
    Key? key,
  }) : super(key: key);
  final IconData icon;
  final bool isActive;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: LiTheme.animationDuration,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isActive ? LiTheme.primary : LiTheme.onBgColor(),
            shape: BoxShape.circle,
            boxShadow: [
              if (isActive)
                const BoxShadow(
                  color: LiTheme.primary,
                  blurRadius: 5,
                  offset: Offset(0, .3),
                )
            ],
          ),
          child: Icon(
            icon,
            size: 22,
            color: isActive ? LiTheme.onPrimary : LiTheme.getPrimary(),
          ),
        ),
      ),
    );
  }
}
