import 'package:flutter/material.dart';


class ReviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reviews'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left:100,right: 100),
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            ReviewCard(
              author: 'John Doe',
              rating: 5.0,
              comment: 'The food was delicious and arrived quickly. Highly recommend!',
            ),
            SizedBox(height: 16.0),
            ReviewCard(
              author: 'Jane Smith',
              rating: 4.9,
              comment: 'The food was good but the delivery took longer than expected.',
            ),
            SizedBox(height: 16.0),
            ReviewCard(
              author: 'Bob Johnson',
              rating: 5.0,
              comment: 'The best food I\'ve ever had! Will definitely order again.',
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
      color: Colors.deepOrange, // Set card color to deep orange
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  // Add CircleAvatar to show user picture
                  radius: 20.0,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, color: Colors.deepOrange),
                ),
     
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.star, color: Colors.amber),
                SizedBox(width: 8.0),
                Icon(Icons.star, color: Colors.amber),
                SizedBox(width: 8.0),
                Icon(Icons.star, color: Colors.amber),
                SizedBox(width: 8.0),
                Icon(Icons.star, color: Colors.amber),
                SizedBox(width: 8.0),
                Icon(Icons.star, color: Colors.amber),
                SizedBox(width: 8.0),
              
              ],
            ),
            SizedBox(height: 8.0),
            Text(
              comment,
              style: TextStyle(
                color: Colors.white, // Set comment text color to white
              ),
            ),
          ],
        ),
      ),
    );
  }
}
