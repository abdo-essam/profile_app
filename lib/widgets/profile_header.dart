import 'package:flutter/material.dart';

import '../constants/app_strings.dart';
import '../models/profile.dart';
import '../theme/app_tokens.dart';
import '../theme/brand_palette.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.profile,
    required this.onToggleTheme,
  });

  final Profile profile;
  final VoidCallback onToggleTheme;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SizedBox(
      height: AppSize.header + AppSize.avatar / 2,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: AppSize.header,
            child: _HeaderBackdrop(),
          ),
          Positioned(
            top: AppSpacing.md,
            left: AppSpacing.xl,
            right: AppSpacing.lg,
            child: SizedBox(
              height: AppSize.iconButton,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      AppStrings.appTitle,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: context.brandPalette.onHeader,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.2,
                      ),
                    ),
                  ),
                  _ThemeButton(isDark: isDark, onPressed: onToggleTheme),
                ],
              ),
            ),
          ),
          Positioned(
            top: AppSize.header - AppSize.avatar / 2,
            left: 0,
            right: 0,
            child: Center(
              child: _Avatar(
                assetPath: profile.avatarAsset,
                name: profile.name,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderBackdrop extends StatelessWidget {
  const _HeaderBackdrop();

  static const double _topCircleSize = 180;
  static const double _bottomCircleSize = 150;

  @override
  Widget build(BuildContext context) {
    final palette = context.brandPalette;

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [palette.headerStart, palette.headerEnd],
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: -60,
            right: -40,
            child: _HeaderCircle(
              size: _topCircleSize,
              color: palette.onHeader,
              opacity: 0.12,
            ),
          ),
          Positioned(
            bottom: -70,
            left: -50,
            child: _HeaderCircle(
              size: _bottomCircleSize,
              color: palette.onHeader,
              opacity: 0.08,
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderCircle extends StatelessWidget {
  const _HeaderCircle({
    required this.size,
    required this.color,
    required this.opacity,
  });

  final double size;
  final Color color;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: color.withValues(alpha: opacity), width: 24),
      ),
    );
  }
}

class _ThemeButton extends StatelessWidget {
  const _ThemeButton({required this.isDark, required this.onPressed});

  final bool isDark;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final palette = context.brandPalette;

    return IconButton(
      onPressed: onPressed,
      tooltip: isDark ? AppStrings.switchToLight : AppStrings.switchToDark,
      icon: Icon(
        isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
        size: 20,
      ),
      style: IconButton.styleFrom(
        backgroundColor: palette.onHeader.withValues(alpha: 0.16),
        foregroundColor: palette.onHeader,
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar({required this.assetPath, required this.name});

  final String assetPath;
  final String name;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    const size = AppSize.avatar;

    return Container(
      width: size,
      height: size,
      padding: const EdgeInsets.all(AppSize.avatarBorder),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: scheme.surface,
        boxShadow: [
          BoxShadow(
            color: scheme.shadow.withValues(alpha: 0.16),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipOval(
        child: Image.asset(
          assetPath,
          fit: BoxFit.cover,
          semanticLabel: '$name ${AppStrings.profilePhoto}',
          errorBuilder: (context, error, stackTrace) => ColoredBox(
            color: scheme.primaryContainer,
            child: Icon(
              Icons.person_rounded,
              size: size * 0.5,
              color: scheme.onPrimaryContainer,
            ),
          ),
        ),
      ),
    );
  }
}
