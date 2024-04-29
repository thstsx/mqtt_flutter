import 'package:flutter/material.dart';

class PublisherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _formKey =
        GlobalKey<FormState>(); // Move _formKey inside build method

    return Scaffold(
      appBar: AppBar(
        title: Text('MQTT Publisher (Flutter)'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'MQTT Publisher',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Publisher',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Divider(),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Topic'),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a topic';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Message'),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a message';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState != null &&
                          _formKey.currentState!.validate()) {
                        // Handle publish button press
                      }
                    },
                    child: Text('Publish'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
