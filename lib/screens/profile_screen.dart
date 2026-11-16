import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/app_strings.dart';
import '../models/profile.dart';
import '../theme/app_tokens.dart';
import '../widgets/info_tile.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_stats.dart';
import '../widgets/section_card.dart';
import '../widgets/skill_chip.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.profile,
    required this.onToggleTheme,
  });

  final Profile profile;
  final VoidCallback onToggleTheme;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: (isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark)
          .copyWith(statusBarColor: Colors.transparent),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: AppSpacing.xxxl),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ProfileHeader(profile: profile, onToggleTheme: onToggleTheme),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    AppSpacing.xl,
                    AppSpacing.lg,
                    AppSpacing.xl,
                    0,
                  ),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: AppSize.contentMaxWidth,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            profile.name,
                            textAlign: TextAlign.center,
                            style: theme.textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.w800,
                              letterSpacing: -0.6,
                            ),
                          ),
                          const SizedBox(height: AppSpacing.xs),
                          Text(
                            '@${profile.handle}',
                            textAlign: TextAlign.center,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: scheme.onSurfaceVariant,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: AppSpacing.md),
                          Text(
                            profile.bio,
                            textAlign: TextAlign.center,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              height: 1.5,
                              color: scheme.onSurfaceVariant,
                            ),
                          ),
                          const SizedBox(height: AppSpacing.xxl),
                          ProfileStats(stats: profile.stats),
                          const SizedBox(height: AppSpacing.lg),
                          SectionCard(
                            title: AppStrings.aboutTitle,
                            child: Column(
                              children: [
                                InfoTile(
                                  icon: Icons.work_outline_rounded,
                                  label: AppStrings.roleLabel,
                                  value: profile.role,
                                ),
                                const Divider(),
                                InfoTile(
                                  icon: Icons.location_on_outlined,
                                  label: AppStrings.locationLabel,
                                  value: profile.location,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: AppSpacing.lg),
                          SectionCard(
                            title: AppStrings.skillsTitle,
                            child: Wrap(
                              spacing: AppSpacing.sm,
                              runSpacing: AppSpacing.sm,
                              children: [
                                for (final skill in profile.skills)
                                  SkillChip(label: skill),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
