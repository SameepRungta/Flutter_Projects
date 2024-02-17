import 'dart:ui';

class Course {
  final String text;
  final String lessons;
  final String imageUrl;

  final String backImage;
  final Color color;

  Course({
    required this.text,
    required this.lessons,
    required this.imageUrl,

    required this.backImage,
    required this.color,
  });
}
