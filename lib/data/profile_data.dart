import '../models/profile.dart';

const profile = Profile(
  name: 'Abdelrahman Essam',
  handle: 'abdelrahman.essam',
  role: 'Mobile App Developer',
  location: 'Cairo, Egypt',
  bio:
      'I build clean, thoughtful mobile experiences. Focused on Flutter, '
      'Android, and the small details that make apps feel effortless.',
  avatarAsset: 'assets/avatar.jpg',
  stats: [
    ProfileStat(value: '24', label: 'Projects'),
    ProfileStat(value: '4+', label: 'Years'),
    ProfileStat(value: '6', label: 'Skills'),
  ],
  skills: ['Flutter', 'Dart', 'Kotlin', 'Jetpack Compose', 'Firebase', 'Git'],
);
