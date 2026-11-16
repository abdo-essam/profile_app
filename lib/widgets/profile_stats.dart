import 'package:flutter/material.dart';

import '../models/profile.dart';
import '../theme/app_tokens.dart';
import 'section_card.dart';

class ProfileStats extends StatelessWidget {
  const ProfileStats({super.key, required this.stats});

  final List<ProfileStat> stats;

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.lg,
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            for (var index = 0; index < stats.length; index++) ...[
              if (index > 0) const VerticalDivider(width: 1),
              Expanded(child: _StatTile(stat: stats[index])),
            ],
          ],
        ),
      ),
    );
  }
}

class _StatTile extends StatelessWidget {
  const _StatTile({required this.stat});

  final ProfileStat stat;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Text(
          stat.value,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w800,
            letterSpacing: -0.3,
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          stat.label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
