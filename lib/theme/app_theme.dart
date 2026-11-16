import 'package:flutter/material.dart';

import 'app_tokens.dart';
import 'brand_palette.dart';

abstract final class AppTheme {
  static const Color _seed = Color(0xFF5B5BD6);

  static final ThemeData light = _build(Brightness.light);
  static final ThemeData dark = _build(Brightness.dark);

  static ThemeData _build(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    final scheme =
        ColorScheme.fromSeed(seedColor: _seed, brightness: brightness).copyWith(
          primary: isDark ? const Color(0xFF9A9AFF) : _seed,
          surface: isDark ? const Color(0xFF17171F) : Colors.white,
        );

    final base = ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: isDark
          ? const Color(0xFF0D0D12)
          : const Color(0xFFF6F6FB),
      extensions: [isDark ? BrandPalette.dark : BrandPalette.light],
    );
    final textColor = isDark
        ? const Color(0xFFEDEDF4)
        : const Color(0xFF1A1A24);

    return base.copyWith(
      textTheme: base.textTheme.apply(
        bodyColor: textColor,
        displayColor: textColor,
      ),
      dividerTheme: DividerThemeData(
        color: scheme.outlineVariant.withValues(alpha: 0.5),
        thickness: 1,
        space: 1,
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          minimumSize: const Size.square(AppSize.iconButton),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.sm),
          ),
        ),
      ),
    );
  }
}
