// import 'package:flutter/material.dart';

// class SubscriberPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('MQTT Flutter Subscriber'),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               'MQTT Flutter',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               'Subscriber',
//               style: TextStyle(
//                 fontSize: 20,
//               ),
//             ),
//           ),
//           Divider(),
//           SizedBox(height: 16),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               decoration: InputDecoration(labelText: 'Topic'),
//               keyboardType: TextInputType.text,
//               textInputAction: TextInputAction.next,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextFormField(
//               decoration: InputDecoration(labelText: 'Message'),
//               keyboardType: TextInputType.multiline,
//               maxLines: 10,
//               readOnly: true,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               decoration: InputDecoration(labelText: 'Status'),
//               readOnly: true,
//             ),
//           ),
//           SizedBox(height: 16),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     // Handle subscribe button press
//                   },
//                   child: Text('Subscribe'),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Handle unsubscribe button press
//                   },
//                   child: Text('Unsubscribe'),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// subscriber.dart
// import 'package:flutter/material.dart';

// class SubscriberPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('MQTT Subscriber (Flutter)'),
//       ),
//       body:

//       Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               'MQTT Subscriber',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               'Subscriber',
//               style: TextStyle(
//                 fontSize: 20,
//               ),
//             ),
//           ),
//           Divider(),
//           SizedBox(height: 16),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               decoration: InputDecoration(labelText: 'Topic'),
//               keyboardType: TextInputType.text,
//               textInputAction: TextInputAction.next,
//               style: TextStyle(fontSize: 16), // Apply custom font size
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     // Handle subscribe button press
//                   },
//                   child: Text('Subscribe'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.green, // Apply custom button color
//                     textStyle:
//                         TextStyle(fontSize: 16), // Apply custom font size
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Handle unsubscribe button press
//                   },
//                   child: Text('Unsubscribe'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.red, // Apply custom button color
//                     textStyle:
//                         TextStyle(fontSize: 16), // Apply custom font size
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class SubscriberPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('MQTT Subscriber (Flutter)'),
//       ),
//       body: Container(
//         color: Colors.grey[200], // Set background color
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 'MQTT Subscriber',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.blue, // Apply custom text color
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 'Subscriber',
//                 style: TextStyle(
//                   fontSize: 20,
//                   color: Colors.black, // Apply custom text color
//                 ),
//               ),
//             ),
//             Divider(),
//             SizedBox(height: 16),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 decoration: InputDecoration(
//                   labelText: 'Topic',
//                   labelStyle: TextStyle(
//                       fontSize: 16), // Apply custom font size to label
//                 ),
//                 keyboardType: TextInputType.text,
//                 textInputAction: TextInputAction.next,
//                 style: TextStyle(
//                     fontSize: 16), // Apply custom font size to input text
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       // Handle subscribe button press
//                     },
//                     child: Text('Subscribe'),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor:
//                           Colors.green, // Apply custom button color
//                       textStyle:
//                           TextStyle(fontSize: 16), // Apply custom font size
//                     ),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       // Handle unsubscribe button press
//                     },
//                     child: Text('Unsubscribe'),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.red, // Apply custom button color
//                       textStyle:
//                           TextStyle(fontSize: 16), // Apply custom font size
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class SubscriberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MQTT Subscriber (Flutter)'),
      ),
      body: Container(
        color: Colors.white, // Set background color to white
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'MQTT Subscriber',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.red, // Apply custom text color
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Subscriber',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.red, // Apply custom text color
                ),
              ),
            ),
            Divider(color: Colors.red), // Add red divider
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Topic',
                  labelStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.red), // Apply custom label color
                  border: OutlineInputBorder(), // Add border to the input field
                ),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                style: TextStyle(
                    fontSize: 16), // Apply custom font size to input text
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Message',
                  labelStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.red), // Apply custom label color
                  border: OutlineInputBorder(), // Add border to the input field
                ),
                keyboardType: TextInputType.multiline,
                maxLines: null, // Allow multiple lines for message input
                style: TextStyle(
                    fontSize: 16), // Apply custom font size to input text
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Status',
                  labelStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.red), // Apply custom label color
                  border: OutlineInputBorder(), // Add border to the input field
                ),
                readOnly: true, // Make status field read-only
                style: TextStyle(
                    fontSize: 16), // Apply custom font size to input text
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle subscribe button press
                    },
                    child: Text('Subscribe'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.green, // Apply custom button color
                      textStyle:
                          TextStyle(fontSize: 16), // Apply custom font size
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle unsubscribe button press
                    },
                    child: Text('Unsubscribe'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // Apply custom button color
                      textStyle:
                          TextStyle(fontSize: 16), // Apply custom font size
                    ),
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
