import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
  _FAQItemState createState() => _FAQItemState();
}

class _FAQItemState extends State<FAQItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ExpansionTile(
        title: Text(
          widget.question,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              widget.answer,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
        onExpansionChanged: (expanded) {
          setState(() {
            _isExpanded = expanded;
          });
        },
        trailing: _isExpanded
            ? Icon(Icons.keyboard_arrow_up)
            : Icon(Icons.keyboard_arrow_down),
      ),
    );
  }
}
