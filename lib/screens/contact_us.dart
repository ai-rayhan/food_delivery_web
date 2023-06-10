// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:food_delivery_web/constants/constant.dart';
// import 'package:url_launcher/url_launcher.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: devicesize(context).width / 6,
                  vertical: devicesize(context).height / 6),
              // color: kSecondaryColor,
              child: Column(
                children: const [
                  Text(
                    "Contact Us",
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'We would love to hear from you!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'If you have any questions, comments, or concerns, please don\'t hesitate to contact us using the form below. You can also reach us by phone or email.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: ContactForm(),
                  ),
                  SizedBox(height: 20),
                  ContactInfo(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactForm extends StatefulWidget {
  const ContactForm({Key? key}) : super(key: key);

  @override
  ContactFormState createState() => ContactFormState();
}

class ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String _email = '';
  String _message = '';

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      // Send email or submit form data to API
      final url =
          'mailto:info@yourwebsite.com?subject=Contact Us&body=$_message';
      // if (await canLaunch(url)) {
      //   await launch(url);
      // } else {
      //   throw 'Could not launch $url';
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Name',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
            onSaved: (value) {
              _name = value!;
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email address';
              } else if (!value.contains('@')) {
                return 'Please enter a valid email address';
              }
              return null;
            },
            onSaved: (value) {
              _email = value!;
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Message',
            ),
            maxLines: 5,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a message';
              }
              return null;
            },
            onSaved: (value) {
              _message = value!;
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            // style: ButtonStyle(backgroundColor:),
            onPressed: _submitForm,
            child: const Text('Send'),
          ),
        ],
      ),
    );
  }
}

class ContactInfo extends StatelessWidget {
  const ContactInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Contact Information',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.phone),
          title: const Text('Phone'),
          subtitle: const Text('+1 (555) 123-4567'),
          onTap: () async {
// if (await canLaunch(url)) {
// await launch(url);
// } else {
// throw 'Could not launch $url';
// }
          },
        ),
        ListTile(
          leading: const Icon(Icons.email),
          title: const Text('Email'),
          subtitle: const Text('info@yourwebsite.com'),
          onTap: () async {
// if (await canLaunch(url)) {
// await launch(url);
// } else {
// throw 'Could not launch $url';
// }
          },
        ),
        const ListTile(
          leading: Icon(Icons.location_on),
          title: Text('Address'),
          subtitle: Text('123 Main Street, Anytown USA'),
        ),
      ],
    );
  }
}
