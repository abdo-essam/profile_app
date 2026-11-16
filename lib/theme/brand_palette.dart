import 'package:flutter/material.dart';

@immutable
class BrandPalette extends ThemeExtension<BrandPalette> {
  const BrandPalette({
    required this.headerStart,
    required this.headerEnd,
    required this.onHeader,
  });

  static const light = BrandPalette(
    headerStart: Color(0xFF6D5BFF),
    headerEnd: Color(0xFFB55CFF),
    onHeader: Colors.white,
  );

  static const dark = BrandPalette(
    headerStart: Color(0xFF5843E0),
    headerEnd: Color(0xFF9A4FD8),
    onHeader: Colors.white,
  );

  final Color headerStart;
  final Color headerEnd;
  final Color onHeader;

  @override
  BrandPalette copyWith({
    Color? headerStart,
    Color? headerEnd,
    Color? onHeader,
  }) {
    return BrandPalette(
      headerStart: headerStart ?? this.headerStart,
      headerEnd: headerEnd ?? this.headerEnd,
      onHeader: onHeader ?? this.onHeader,
    );
  }

  @override
  BrandPalette lerp(ThemeExtension<BrandPalette>? other, double t) {
    if (other is! BrandPalette) return this;
    return BrandPalette(
      headerStart: Color.lerp(headerStart, other.headerStart, t)!,
      headerEnd: Color.lerp(headerEnd, other.headerEnd, t)!,
      onHeader: Color.lerp(onHeader, other.onHeader, t)!,
    );
  }
}

extension BrandPaletteContext on BuildContext {
  BrandPalette get brandPalette =>
      Theme.of(this).extension<BrandPalette>() ?? BrandPalette.light;
}
