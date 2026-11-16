class Profile {
  const Profile({
    required this.name,
    required this.handle,
    required this.role,
    required this.bio,
    required this.location,
    required this.avatarAsset,
    required this.stats,
    required this.skills,
  });

  final String name;
  final String handle;
  final String role;
  final String bio;
  final String location;
  final String avatarAsset;
  final List<ProfileStat> stats;
  final List<String> skills;
}

class ProfileStat {
  const ProfileStat({required this.value, required this.label});

  final String value;
  final String label;
}
