import 'package:flutter/material.dart';

class MainBottomBar extends StatefulWidget {
  final ValueChanged<Color> onColorChange;
  final bool allowChangePrimerColor;

  const MainBottomBar({
    required this.onColorChange,
    required this.allowChangePrimerColor,
    Key? key,
  }) : super(key: key);

  @override
  _MainBottomBarState createState() => _MainBottomBarState();
}

class _MainBottomBarState extends State<MainBottomBar> {
  double _red = 255;
  double _green = 255;
  double _blue = 255;

  void _updateColor() {
    widget.onColorChange(
        Color.fromARGB(255, _red.toInt(), _green.toInt(), _blue.toInt()));
  }

  Widget _buildSliderWithText({
    required String label,
    required double value,
    required Function(double) onChanged,
    required VoidCallback onPrimerChange,
    Color primerColor = Colors.red,
  }) {
    return widget.allowChangePrimerColor
        ? Row(
            children: [
              Expanded(
                child: Slider(
                  value: value,
                  min: 0,
                  max: 255,
                  divisions: 255,
                  label: value.toInt().toString(),
                  onChanged: (newValue) {
                    onChanged(newValue);
                    _updateColor();
                  },
                  activeColor: Colors.brown,
                  inactiveColor: Colors.brown.withOpacity(0.3),
                ),
              ),
              FloatingActionButton(
                onPressed: onPrimerChange,
                backgroundColor: primerColor,
                shape: const CircleBorder(),
                child: Text(
                  value.toInt().toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          )
        : Text(
            '$label: ${value.toInt()}',
            style: const TextStyle(fontSize: 16),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          height: 180.0,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            _buildSliderWithText(
              label: 'Red',
              value: _red,
              onChanged: (newValue) {
                setState(() {
                  _red = newValue;
                });
              },
              onPrimerChange: () {
                setState(() {
                  _red = 255;
                  _green = 0;
                  _blue = 0;
                  _updateColor();
                });
              },
              primerColor: Colors.red,
            ),
            _buildSliderWithText(
              label: 'Green',
              value: _green,
              onChanged: (newValue) {
                setState(() {
                  _green = newValue;
                });
              },
              onPrimerChange: () {
                setState(() {
                  _red = 0;
                  _green = 255;
                  _blue = 0;
                  _updateColor();
                });
              },
              primerColor: Colors.green,
            ),
            _buildSliderWithText(
              label: 'Blue',
              value: _blue,
              onChanged: (newValue) {
                setState(() {
                  _blue = newValue;
                });
              },
              onPrimerChange: () {
                setState(() {
                  _red = 0;
                  _green = 0;
                  _blue = 255;
                  _updateColor();
                });
              },
              primerColor: Colors.blue,
            ),
          ]),
        ));
  }
}
