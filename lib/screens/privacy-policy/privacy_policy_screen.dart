import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
        backgroundColor: Color(0xFF3F51B5),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Privacy Policy',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3F51B5),
                  ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Introduction',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Your privacy is important to us. This privacy policy explains how we collect, use, and protect your personal information when you use the QEase app.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 16.0),
            Text(
              'Information We Collect',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: 8.0),
            Text(
              'We collect information that you provide to us directly, such as when you create an account, update your profile, or use our services. This information may include your name, email address, phone number, and other personal details.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 16.0),
            Text(
              'How We Use Your Information',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: 8.0),
            Text(
              'We use your information to provide and improve our services, communicate with you, and ensure the security of our platform. Specifically, we use your information to:'
              '\n- Manage your queue positions'
              '\n- Provide real-time queue tracking'
              '\n- Facilitate communication between you and service providers'
              '\n- Send timely notifications',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 16.0),
            Text(
              'Sharing Your Information',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: 8.0),
            Text(
              'We do not share your personal information with third parties except as necessary to provide our services, comply with legal obligations, or protect our rights. This may include sharing information with:'
              '\n- Service providers involved in your queue management'
              '\n- Third-party service providers who assist us in operating our platform',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 16.0),
            Text(
              'Data Security',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: 8.0),
            Text(
              'We implement appropriate technical and organizational measures to protect your personal information from unauthorized access, disclosure, alteration, or destruction. However, please be aware that no security measures are perfect or impenetrable.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 16.0),
            Text(
              'Your Rights',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: 8.0),
            Text(
              'You have the right to access, update, and delete your personal information. You can also object to the processing of your information or request that we restrict its use. To exercise these rights, please contact us at privacy@qease.com.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 16.0),
            Text(
              'Changes to This Policy',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: 8.0),
            Text(
              'We may update this privacy policy from time to time. We will notify you of any changes by posting the new policy on our app and updating the effective date. Your continued use of our services after any changes indicates your acceptance of the new policy.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 16.0),
            Text(
              'Contact Us',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: 8.0),
            Text(
              'If you have any questions or concerns about our privacy policy, please contact us at privacy@qease.com.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}