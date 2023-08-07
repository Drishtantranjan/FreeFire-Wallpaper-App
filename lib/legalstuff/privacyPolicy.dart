import 'package:flutter/material.dart';

class Privacy extends StatelessWidget {
  const Privacy({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Privacy Policy",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(height: 10),
              PrivacyItem(
                title: "Information We Collect",
                content:
                    "In order to provide our wallpaper services, we may collect certain information from you, including but not limited to your device information, usage data, and user preferences. This information is used to improve and personalize your experience with the app.",
              ),
              PrivacyItem(
                title: "Use of Collected Information",
                content:
                    "The information we collect is used to analyze usage patterns, troubleshoot issues, improve our services, and personalize the content and recommendations we provide. We do not share or sell your personal information to third parties.",
              ),
              PrivacyItem(
                title: "Data Security",
                content:
                    "We take reasonable measures to protect the security of your information and ensure that it is treated securely. However, please note that no method of transmission or storage is 100% secure, and we cannot guarantee the absolute security of your data.",
              ),
              PrivacyItem(
                title: "Third-Party Services",
                content:
                    "Our app may contain links to third-party websites or services that are not owned or controlled by us. We are not responsible for the privacy practices or content of such third-party services. We recommend reviewing their privacy policies before using their services.",
              ),
              PrivacyItem(
                title: "Changes to This Privacy Policy",
                content:
                    "We reserve the right to update or modify this privacy policy at any time. Any changes will be effective immediately upon posting the updated policy in the app. We encourage you to review this policy periodically to stay informed about how we collect, use, and protect your information.",
              ),
              PrivacyItem(
                title: "Contact Us",
                content:
                    "If you have any questions or concerns regarding our privacy policy or the handling of your personal information, please contact us at [email protected]",
              ),
              PrivacyItem(
                title: "Effective Date",
                content: "This privacy policy is effective as of 30th of June.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PrivacyItem extends StatelessWidget {
  final String title;
  final String content;

  const PrivacyItem({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 4),
          Text(content),
        ],
      ),
    );
  }
}
