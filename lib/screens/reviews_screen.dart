import 'package:flutter/material.dart';
import 'package:food_delivery_web/components/footer.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        elevation: 0,
        title: const Text('Reviews'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              child: Stack(
                children: [
                  Image.network(
                    'https://resizer.otstatic.com/v2/photos/wide-xlarge/2/51140253.jpg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Customer Reviews',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'See what our customers are saying',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: const [
                  ReviewCard(
                    author: 'John Doe',
                    rating: 5.0,
                    comment:
                        'The food was delicious and arrived quickly. Highly recommend!',
                  ),
                  SizedBox(height: 16.0),
                  ReviewCard(
                    author: 'Jane Smith',
                    rating: 4.9,
                    comment:
                        'The food was good but the delivery took longer than expected.',
                  ),
                  SizedBox(height: 16.0),
                  ReviewCard(
                    author: 'Bob Johnson',
                    rating: 5.0,
                    comment:
                        'The best food I\'ve ever had! Will definitely order again.',
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

class ReviewCard extends StatelessWidget {
  final String author;
  final double rating;
  final String comment;

  const ReviewCard({
    Key? key,
    required this.author,
    required this.rating,
    required this.comment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20.0,
                  backgroundColor: Colors.deepOrange,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                const SizedBox(width: 8.0),
                Text(
                  author,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12.0),
            Row(
              children: List.generate(5, (index) {
                if (index < rating.floor()) {
                  return Icon(Icons.star, color: Colors.amber);
                } else {
                  return Icon(Icons.star_border, color: Colors.amber);
                }
              }),
            ),
            const SizedBox(height: 12.0),
            Text(
              comment,
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 12.0),
            Divider(color: Colors.black38),
            const SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Helpful?',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.thumb_up_alt),
                      label: Text('Yes'),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.thumb_down_alt),
                      label: Text('No'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
