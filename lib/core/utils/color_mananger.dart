
import 'dart:ui';

abstract class ColorManager {
  static const Color primary = Color(0xFF203864);
  static const Color secondaryPrimary = Color(0xFF040D12);
  static const Color darkPrimary = Color(0xFF204624);
  static const Color white = Color(0xFFfafafa);
  static const Color iceWhite = Color(0xFFEDEDED);
  static const Color lightGray = Color(0xFFDBDBDB);
  static const Color lightBlue = Color(0xFFA7BADC);
  static const Color red = Color(0xFFE74C3C);
  static const Color lightRed = Color(0xFFCFB9B9);
  static const Color green = Color(0xFF2ECC71);
  static const Color lightGreen = Color(0xFF27B05F);
  static const Color gray = Color(0xFFDADADA);
  static const Color black = Color(0xFF000000);
  static const Color skyBlue = Color(0xFFDFE7F5);

  static Color getGradeColor(String? grade) {
    switch (grade) {
      case 'ضعيف':
        return red;
      case 'ضعيف جدا':
        return red;
      default:
        return lightGreen;
    }
  }
}

