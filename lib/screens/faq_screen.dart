import 'package:flutter/material.dart';

import '../components/header.dart';
import '../constants/constant.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Header(),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: devicesize(context).width / 6,
                  vertical: devicesize(context).height / 6),
              child: Column(
                children: const [
                  Text(
                    "Frequently Asked Questions",
                    style: TextStyle(fontSize: 30),
                  ),
                  FAQItem(
                    question: 'How do I place an order?',
                    answer:
                        'You can place an order by browsing our menu and selecting the items you want. Once you have added all your items to your cart, proceed to checkout and complete your order.',
                  ),
                  FAQItem(
                    question: 'How long does it take to receive my order?',
                    answer:
                        'Delivery times may vary depending on your location and the time of day. You can track your order status in real-time using our app.',
                  ),
                  FAQItem(
                    question: 'What payment methods do you accept?',
                    answer:
                        'We accept all major credit cards, PayPal, and cash on delivery.',
                  ),
                  FAQItem(
                    question: 'Do you offer refunds or returns?',
                    answer:
                        'We offer refunds and returns for orders that have not yet been delivered. If you have any issues with your order, please contact our customer support team for assistance.',
                  ),
                  FAQItem(
                    question: 'Can I customize my order?',
                    answer:
                        'Yes, you can customize your order by adding special instructions or requesting specific ingredients. Please note that some customizations may result in additional charges.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FAQItem extends StatefulWidget {
  final String question;
  final String answer;

  const FAQItem({
    Key? key,
    required this.question,
    required this.answer,
  }) : super(key: key);

  @override
  FAQItemState createState() => FAQItemState();
}

class FAQItemState extends State<FAQItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: ExpansionTile(
        title: Text(
          widget.question,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        onExpansionChanged: (expanded) {
          setState(() {
            _isExpanded = expanded;
          });
        },
        trailing: _isExpanded
            ? const Icon(Icons.keyboard_arrow_up)
            : const Icon(Icons.keyboard_arrow_down),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              widget.answer,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
