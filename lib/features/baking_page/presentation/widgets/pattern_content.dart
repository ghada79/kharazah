import 'package:flutter/material.dart';

class PatternContent extends StatefulWidget {
  final Function(Map<String, dynamic>) onItemSelected;

  const PatternContent({required this.onItemSelected});

  @override
  _FlavorContentState createState() => _FlavorContentState();
}

class _FlavorContentState extends State<PatternContent> {
  String? selectedPattern;
  String? selectedPatternImage;

  @override
  Widget build(BuildContext context) {
    List<String> patterns = [
      'Modern',
      'Casual',
      'Different',

    ];
    List<String> patternImages = [
      'assets/pattern/Modern.png',
      'assets/pattern/Casual.png',
      'assets/pattern/Different.png',

    ];

    return GridView.builder(
      padding: EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.9,
        crossAxisSpacing: 20,
        mainAxisSpacing:35,
      ),
      itemCount: patterns.length, // عدلناها علشان تكون على طول بتاخد طول list
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            setState(() {
              selectedPattern = patterns[index];
              selectedPatternImage = patternImages[index];
            });
            widget.onItemSelected({
              'title': selectedPattern,
              'image': selectedPatternImage,
            });
          },
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  patternImages[index],
                  height: 70,
                  width: 60,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 12),
                Text(patterns[index]),
              ],
            ),
          ),
        );
      },
    );
  }
}
