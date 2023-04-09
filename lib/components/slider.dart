import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SliderWidget extends StatefulWidget {
  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  List<String> _urls = [];
  int _currentIndex = 0;
  Timer? _timer = null;

  @override
  void initState() {
    super.initState();
    _getUrls();
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      if (_urls.isNotEmpty) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % _urls.length;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _getUrls() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('sliders')
          .doc('imagelist')
          .get();
      final data = snapshot.data() as Map<String, dynamic>;
      final urls = List<String>.from(data['urls']);
      setState(() {
        _urls = urls;
      });
    } catch (e) {
      print('Error getting slider images: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: PageView.builder(
        itemCount: _urls.length,
        itemBuilder: (context, index) {
          return Image.network(
            _urls[_currentIndex],
            fit: BoxFit.cover,
          );
        },
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
