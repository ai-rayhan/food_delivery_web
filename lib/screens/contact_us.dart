import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'We would love to hear from you!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'If you have any questions, comments, or concerns, please don\'t hesitate to contact us using the form below. You can also reach us by phone or email.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ContactForm(),
            ),
            SizedBox(height: 20),
            ContactInfo(),
          ],
        ),
      ),
    );
  }
}




class ContactForm extends StatefulWidget {
  const ContactForm({Key? key}) : super(key: key);

  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String _email = '';
  String _message = '';

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      // Send email or submit form data to API
      final url = 'mailto:info@yourwebsite.com?subject=Contact Us&body=$_message';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
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
          SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
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
          SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
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
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _submitForm,
            child: Text('Send'),
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
Padding(
padding: const EdgeInsets.all(16.0),
child: Text(
'Contact Information',
style: TextStyle(
fontSize: 24,
fontWeight: FontWeight.bold,
),
),
),
ListTile(
leading: Icon(Icons.phone),
title: Text('Phone'),
subtitle: Text('+1 (555) 123-4567'),
onTap: () async {
final url = 'tel:+15551234567';
if (await canLaunch(url)) {
await launch(url);
} else {
throw 'Could not launch $url';
}
},
),
ListTile(
leading: Icon(Icons.email),
title: Text('Email'),
subtitle: Text('info@yourwebsite.com'),
onTap: () async {
final url = 'mailto:info@yourwebsite.com';
if (await canLaunch(url)) {
await launch(url);
} else {
throw 'Could not launch $url';
}
},
),
ListTile(
leading: Icon(Icons.location_on),
title: Text('Address'),
subtitle: Text('123 Main Street, Anytown USA'),
),
],
);
}
}
