import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int iconSize;
  final Function(int) onSizeChange;
  final bool allowResize;

  MainAppBar({
    required this.iconSize,
    required this.onSizeChange,
    required this.allowResize,
  });

  @override
  Size get preferredSize => Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.brown,
      iconTheme: const IconThemeData(color: Colors.white),
      title: Text(
        'My Icon',
        style: TextStyle(fontSize: 25.0, color: Colors.white),
      ),
      actions: [
        if (allowResize) ...[
          IconButton(
            icon: const Icon(Icons.remove_circle_outline),
            iconSize: 30.0,
            onPressed: () {
              onSizeChange(iconSize - 50);
            },
          ),
          Container(
            width: 28.0,
            height: 28.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2.0),
            ),
            child: IconButton(
              icon: const Text(
                'S',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              onPressed: () {
                onSizeChange(100);
              },
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Container(
            width: 28.0,
            height: 28.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2.0),
            ),
            child: IconButton(
              icon: const Text(
                'M',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              onPressed: () {
                onSizeChange(300);
              },
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Container(
            width: 28.0,
            height: 28.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2.0),
            ),
            child: IconButton(
              icon: const Text(
                'L',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              onPressed: () {
                onSizeChange(500);
              },
            ),
          ),
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            iconSize: 30.0,
            onPressed: () {
              onSizeChange(iconSize + 50);
            },
          ),
        ]
      ],
    );
  }
}
