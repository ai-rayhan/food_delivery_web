import 'package:flutter/material.dart';

const url1 =
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcMHdwPq2ZRZxJwZCvZMHqvIasUNsIwtpmcQ&usqp=CAU';
const url2 =
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTweN3PH1p_cSfkeueeUZ7sxVhNzCPWPPbgww&usqp=CAU';

class OfferCard extends StatelessWidget {
  const OfferCard({super.key});
  responsive(context) {
    var devicesize = MediaQuery.of(context).size.width;
    if (devicesize <= 700) {
      return 100;
    } else {
      return 200;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: InkWell(
                child: Image.network(
                  url1,
                  fit: BoxFit.cover,
                  height: responsive(context),
                ),
              )),
          Expanded(
              flex: 2,
              child: InkWell(
                child: Image.network(
                  url2,
                  fit: BoxFit.cover,
                  height: responsive(context),
                ),
              )),
        ],
      ),
    );
  }
}
