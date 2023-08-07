import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  const Help({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Do you need help?",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Frequently Asked Questions (FAQ)",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  FaqItem(
                    questionNumber: "1.",
                    question: "How do I download wallpapers from the app?",
                    answer:
                        "Currently, our app does not have a download option. However, we are actively working on implementing this feature in the near future. Once the download option is available, you will be able to follow these steps to download wallpapers from our app: ...",
                  ),
                  FaqItem(
                    questionNumber: "2.",
                    question:
                        "Can I use the wallpapers for commercial purposes?",
                    answer:
                        "The wallpapers in our app are intended for personal use only. You are not permitted to use them for commercial purposes without obtaining proper permissions or licenses from the respective copyright holders.",
                  ),
                  FaqItem(
                    questionNumber: "3.",
                    question:
                        "How do I set a wallpaper as my device background?",
                    answer:
                        "To set a wallpaper as your device background, please select the wallpaper and tap on set as wallpaper button.",
                  ),
                  FaqItem(
                    questionNumber: "4.",
                    question: "How can I report an issue or provide feedback?",
                    answer:
                        "We appreciate your feedback and encourage you to report any issues or suggestions you have. To report an issue or provide feedback, you can use the 'Contact Us' option in our app or send us an email at [email protected]",
                  ),
                  FaqItem(
                    questionNumber: "5.",
                    question:
                        "I believe a wallpaper infringes my copyright. What should I do?",
                    answer:
                        "If you believe that any wallpaper available in our app infringes upon your copyright or ownership rights, please contact us through the designated contact information provided in the app. We will promptly investigate the matter and, if appropriate, remove the wallpaper in question from our app.",
                  ),
                  // Add more FaqItem widgets for additional FAQ entries
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FaqItem extends StatelessWidget {
  final String questionNumber;
  final String question;
  final String answer;

  const FaqItem({
    required this.questionNumber,
    required this.question,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            questionNumber + question,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 4),
          Text(answer),
        ],
      ),
    );
  }
}
