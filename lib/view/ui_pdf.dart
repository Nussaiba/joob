import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jobs/core/constants/imageassest.dart';

class CVPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 16),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  const SizedBox(
                    height: 4,
                  ),
                  Expanded(
                    flex: 5,
                    child: ProfileSection(),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  const SizedBox(
                    height: 4,
                  ),
                  const Profile(),
                  ExperienceSection(),
                  SkillsSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(AppImageAsset.logo),
          ),
          const Text('Your Name mmm  mm',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          const Text('Your Title',
              style: TextStyle(
                  fontSize: 12, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Divider(
          height: 2,
          endIndent: 14,
          indent: 14,
        ),
        
          const SizedBox(height: 8),
          EducationSection()
        ],
      ),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({super.key});
  @override
  Widget build(BuildContext context) {
    return const SectionTitle(
      title: 'Profile',
      child: Text(
          'Short bio or profile description goes here. You can add more details about yourself, your experience, and your goals.' +
              'Short bio or profile description goes here. You can add more details about yourself, your experience, and your goals.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12, height: 1.5)),
    );
  }
}

class EducationSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
         Padding(
          padding: EdgeInsets.only(right: 14),
          child: Text('Education',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
        ),
        ListTile(
          //  leading  : Icon(Icons.school, size: 10,),
          title: Text(
            'University Name',
            style: TextStyle(fontSize: 12),
          ),
          subtitle: Text(
            'Degree, Field of Study, Graduation Year',
            style: TextStyle(fontSize: 10),
          ),
        ),
      ],
    );
  }
}

class ExperienceSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SectionTitle(
      title: 'Experience',
      child: ListTile(
        leading: Icon(Icons.work),
        title: Text('Company Name'),
        subtitle: Text('Job Title, Duration'),
      ),
    );
  }
}

class SkillsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SectionTitle(
      title: 'Professional Skills',
      child: Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children: List.generate(
          5,
          (index) => Chip(
            label: Text('Skill ${index + 1}'),
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final Widget child;
  const SectionTitle({required this.title, required this.child});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 14),
          child: Text(title,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
        ),
        child,
        const SizedBox(height: 4),
        const Divider(
          height: 2,
          endIndent: 14,
          indent: 14,
        ),
        const SizedBox(
          height: 4,
        ),
      ],
    );
  }
}
